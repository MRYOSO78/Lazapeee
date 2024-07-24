import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetailScreen(productId: product.id),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
                height: 140.0,
                width: double.infinity,
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 5),
                child: Text(
                  product.title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Stock ${product.stock} left',style: TextStyle(color: Colors.black54),),

                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text('\$${product.price.toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('  ${product.discountPercentage}% off',style: TextStyle(color: Colors.black38),),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
