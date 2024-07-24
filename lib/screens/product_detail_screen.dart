import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_bloc.dart';
import '../blocs/product_event.dart';
import '../blocs/product_state.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;
  ProductDetailScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details ',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Color(0xFFF99417),
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(RepositoryProvider.of(context))..add(FetchProductDetails(productId)),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (ctx, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            } else if (state is ProductDetailsLoaded) {
              final product = state.product;
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Container(child: Image.network(product.thumbnail))),
                    SizedBox(height: 8.0),
                    Text(product.title, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('\$${product.price}', style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold)),
                        Text('  ${product.discountPercentage}% off', style: TextStyle(fontSize: 16.0,color: Colors.black38)),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('Available Stock: ', style: TextStyle(fontSize: 16.0)),
                        Text('${product.stock}', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
                        Text(' left', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    SizedBox(height: 15.0),

                    Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                    SizedBox(height: 5.0),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF99417),
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            onPressed: () { },
                            child: Text('Add To cart',style: TextStyle(fontSize: 25,color: Colors.white),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
