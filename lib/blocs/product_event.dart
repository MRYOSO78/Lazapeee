import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductEvent {
  final int skip;

  FetchProducts(this.skip);

  @override
  List<Object> get props => [skip];
}

class FetchProductDetails extends ProductEvent {
  final int id;

  FetchProductDetails(this.id);

  @override
  List<Object> get props => [id];
}
