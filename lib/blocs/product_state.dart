import 'package:equatable/equatable.dart';
import '../models/product.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductDetailsLoaded extends ProductState {
  final Product product;

  ProductDetailsLoaded(this.product);

  @override
  List<Object> get props => [product];
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object> get props => [message];
}
