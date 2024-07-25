import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lazapee/blocs/product_bloc.dart'; // Ensure consistent import paths
import 'package:lazapee/blocs/product_event.dart';
import 'package:lazapee/blocs/product_state.dart';
import 'package:lazapee/services/api_service.dart';
import 'package:lazapee/models/product.dart';
import 'api_service_test.mocks.dart';
import 'api_service_test.mocks.mocks.dart';

// Annotate the test file to generate mock classes
@GenerateMocks([ApiService])
void main() {
  group('ProductBloc', () {
    late MockApiService mockApiService;
    late ProductBloc productBloc;

    setUp(() {
      mockApiService = MockApiService();
      productBloc = ProductBloc(mockApiService);
    });

    tearDown(() {
      productBloc.close();
    });

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoading, ProductLoaded] when FetchProducts is added',
      build: () {
        when(mockApiService.fetchProducts(any)).thenAnswer(
              (_) async => [
            Product(id: 1, title: 'Product 1', price: 100.0, thumbnail: 'thumbnail', stock: 10, discountPercentage: 10.0),
          ],
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(FetchProducts(0)),
      expect: () => [
        ProductLoading(),
        ProductLoaded([
          Product(id: 1, title: 'Product 1', price: 100.0, thumbnail: 'thumbnail', stock: 10, discountPercentage: 10.0),
        ]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoading, ProductError] when FetchProducts fails',
      build: () {
        when(mockApiService.fetchProducts(any)).thenThrow(Exception('Failed to load products'));
        return productBloc;
      },
      act: (bloc) => bloc.add(FetchProducts(0)),
      expect: () => [
        ProductLoading(),
        ProductError('Exception: Failed to load products'),
      ],
    );
  });
}
