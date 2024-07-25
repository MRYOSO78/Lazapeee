import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;

  ProductBloc(this.apiService) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchProductDetails>(_onFetchProductDetails);
  }

  void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await apiService.fetchProducts(event.skip);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void _onFetchProductDetails(FetchProductDetails event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final product = await apiService.fetchProductDetails(event.id);
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
