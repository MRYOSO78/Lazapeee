import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import '../blocs/product_bloc.dart';
import '../blocs/product_event.dart';
import '../blocs/product_state.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatelessWidget {
  final int productId;
  ProductDetailScreen({super.key, required this.productId});
  var text = lorem(paragraphs: 2, words: 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details ',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: const Color(0xFFF99417),
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(RepositoryProvider.of(context))..add(FetchProductDetails(productId)),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (ctx, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            } else if (state is ProductDetailsLoaded) {
              final product = state.product;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.network(product.thumbnail)),
                    const SizedBox(height: 8.0),
                    Text(product.title, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('\$${product.price}', style: const TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold)),
                        Text('  ${product.discountPercentage}% off', style: const TextStyle(fontSize: 16.0,color: Colors.black38)),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Text('Available Stock: ', style: TextStyle(fontSize: 16.0)),
                        Text('${product.stock}', style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
                        const Text(' left', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    const Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                    const SizedBox(height: 5.0),
                    Text(text),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF99417),
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            onPressed: () { },
                            child: const Text('Add To cart',style: TextStyle(fontSize: 25,color: Colors.white),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
