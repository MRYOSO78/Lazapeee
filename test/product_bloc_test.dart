// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:lazapee/blocs/product_bloc.dart';
// import 'package:lazapee/blocs/product_event.dart';
// import 'package:lazapee/blocs/product_state.dart';
// import 'package:lazapee/services/api_service.dart';
// import 'package:lazapee/models/product.dart';
//
// import 'product_bloc_test.mocks.dart';
//
// @GenerateMocks([ApiService])
//
// void main() {
//   group('ProductBloc Tests', () {
//     late MockApiService mockApiService;
//     late ProductBloc productBloc;
//
//     setUp(() {
//       mockApiService = MockApiService();
//       productBloc = ProductBloc(mockApiService as ApiService);
//     });
//
//     blocTest<ProductBloc, ProductState>(
//       'emits [ProductLoading, ProductLoaded] when FetchProducts is added',
//       build: () {
//         final products = [
//           Product(id: 1, title: 'Product 1', price: 100.0, thumbnail: 'thumbnail', stock: 10, discountPercentage: 10.0),
//           // Add more products if necessary
//         ];
//         when(mockApiService.fetchProducts(any)).thenAnswer((_) async => products);
//         return productBloc;
//       },
//       act: (bloc) => bloc.add(FetchProducts(0)),
//       expect: () => [
//         ProductLoading(),
//         ProductLoaded([
//           Product(id: 1, title: 'Product 1', price: 100.0, thumbnail: 'thumbnail', stock: 10, discountPercentage: 10.0),
//         ]),
//       ],
//     );
//
//     blocTest<ProductBloc, ProductState>(
//       'emits [ProductLoading, ProductError] when FetchProducts fails',
//       build: () {
//         when(mockApiService.fetchProducts(any)).thenThrow(Exception('Failed to load products'));
//         return productBloc;
//       },
//       act: (bloc) => bloc.add(FetchProducts(0)),
//       expect: () => [
//         ProductLoading(),
//         ProductError('Exception: Failed to load products'),
//       ],
//     );
//   });
// }
//
// class MockApiService implements HttpService {
//   @override
//   Future<http.Response> fetchData() async {
//     return http.Response('Mocked Response', 200);
//   }
//
//
// abstract class HttpService {
//   Future<http.Response> fetchData();
// }
