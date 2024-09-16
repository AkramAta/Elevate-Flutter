import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/Business_Logic/Cubit/product_cubit.dart';
import 'package:task_1/Business_Logic/Cubit/product_state.dart';
import 'package:task_1/widgets/product_card.dart'; // Import ProductCard

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Store'),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.65,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductCard(product: product);
                },
              ),
            );
          } else if (state is ProductError) {
            return Center(
              child: Text(
                'Failed to load products',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
