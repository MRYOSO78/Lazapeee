import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/product_list_screen.dart';
import 'services/api_service.dart';
import 'blocs/product_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiService>(create: (_) => ApiService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(create: (context) => ProductBloc(context.read<ApiService>())),
        ],
        child: MaterialApp(
          title: 'Product App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: ProductListScreen(),
        ),
      ),
    );
  }
}
