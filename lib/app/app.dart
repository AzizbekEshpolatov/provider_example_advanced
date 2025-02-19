import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/data/services/product_api.dart';
import 'package:flutter_bloc_example/ui/products_test_screen/main_screen.dart';
import 'package:provider/provider.dart';
import '../data/repository/product_repository.dart';
import '../view_model/product_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(
            ProductRepository(ProductApi()),
          )..fetchProducts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const MainScreen(),
      ),
    );
  }
}
