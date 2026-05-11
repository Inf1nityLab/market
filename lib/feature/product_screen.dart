import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/cubit/product_cubit.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is ProductError) {
            return Center(
              child: Text(state.message, style: TextStyle(color: Colors.red)),
            );
          }

          if (state is ProductSuccess) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.6
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade100,
                  child: Column(
                    children: [
                      Image.network(state.data[index].imageUrl!),
                      Text(state.data[index].title),
                      Text(state.data[index].price.toString()),
                      Text(state.data[index].currency),
                    ],
                  ),
                );
              },
            );
          }


          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<ProductCubit>().getProducts();
              },
              child: Text('Получить товары'),
            ),
          );
        },
      ),
    );
  }
}
