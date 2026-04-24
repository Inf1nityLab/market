import 'package:flutter/material.dart';
import 'package:marketplace/shared/circle_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/brands_model.dart';
import '../model/products_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logout() async {
    try {
      await Supabase.instance.client.auth.signOut();

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<List<BrandsModel>> fetchBrands() async {
    final response = await Supabase.instance.client
        .from('brands')
        .select()
        .order('title'); // Сортируем по алфавиту для порядка

    return (response as List)
        .map((brand) => BrandsModel.fromJson(brand))
        .toList();
  }

  Future<List<ProductsModel>> fetchProducts() async {
    final response = await Supabase.instance.client.from('products1').select();

    return (response as List)
        .map((product) => ProductsModel.fromJson(product))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: CircleButton(
        //   image: 'assets/images/women.png',
        //   onTap: (){},
        // ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(
              onPressed: logout,
              child: Text(
                'Выйти из приложения',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ],
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: FutureBuilder<List<BrandsModel>>(
                future: fetchBrands(),
                builder: (context, snapshot) {
                  // Пока данные в пути
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Если что-то пошло не так
                  if (snapshot.hasError) {
                    return Text("Ошибка: ${snapshot.error}");
                  }

                  // Когда данные пришли, они попадают в snapshot.data
                  // Вот здесь и появляется переменная brands!
                  final brands = snapshot.data ?? [];

                  if (brands.isEmpty) {
                    return const Text("Бренды не найдены");
                  }

                  // 4. Отрисовка списка
                  return SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // brands.length берет количество элементов из результата запроса выше
                      itemCount: brands.length,
                      itemBuilder: (context, index) {
                        final brand = brands[index];
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            brand.title,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Expanded(
              child: FutureBuilder(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text("Ошибка: ${snapshot.error}");
                  }
                  final products = snapshot.data ?? [];
                  if (products.isEmpty) {
                    return const Text("Продукты не найдены");
                  }
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey.shade100,
                        child: Column(
                          children: [
                            Text(snapshot.data![index].name),
                            Text('${snapshot.data![index].price}'),
                            Image.network(
                              snapshot.data![index].imageUrl,
                              height: 100,
                              width: 100,
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
