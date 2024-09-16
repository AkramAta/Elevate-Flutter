import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:task_1/Model/Products.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Product> products = data.map((item) => Product.fromJson(item)).toList();
        emit(ProductLoaded(products));
      } else {
        emit(ProductError());
      }
    } catch (e) {
      emit(ProductError());
    }
  }
}
