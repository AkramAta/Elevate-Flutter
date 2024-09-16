import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/Business_Logic/Cubit/product_cubit.dart';
import 'package:task_1/Screens/ProductsScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..fetchProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductScreen(),
      ),
    );
  }
}
