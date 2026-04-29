import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketplace/shared/circle_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/sized_box_widget.dart';
import '../model/brands_model.dart';
import '../model/products_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedBrandId;
  String? searchText;
  Timer? _debounce;

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

  Future<List<ProductsModel>> fetchProducts({
    String? brandId,
    String? searchText,
  }) async {
    var query = Supabase.instance.client.from('products1').select();

    if (brandId != null) {
      query = query.eq('brand_id', brandId);
    }

    if (searchText != null) {
      query = query.ilike('name', '%$searchText%');
    }
    final response = await query;

    return (response as List)
        .map((product) => ProductsModel.fromJson(product))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SearchBody(
              onChanged: (value) {
                // Если пользователь продолжает печатать, отменяем старый таймер
                if (_debounce?.isActive ?? false) _debounce!.cancel();

                // Запускаем новый таймер на 500 миллисекунд
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  setState(() {
                    searchText = value
                        .trim(); // Обновляем текст и перерисовываем экран
                  });
                });
              },
            ),

            SizesBoxWidget(height: 20),
            CategoryBody(
              brands: fetchBrands(),
              selectedBrandId: selectedBrandId,
              onTap: (brandId) {
                setState(() {
                  selectedBrandId = (selectedBrandId == brandId)
                      ? null
                      : brandId;
                });
              },
            ),

            SizesBoxWidget(height: 20),

            ProductBody(
              products: fetchProducts(
                brandId: selectedBrandId,
                searchText: searchText,
              ),
            ),


          ],
        ),
      ),
    );
  }
}

class ProductBody extends StatelessWidget {
  final Future<List<ProductsModel>> products;

  const ProductBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder(
        future: products,
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
              return GestureDetector(
                onTap: (){},
                child: Container(
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  final Function(String)? onChanged;

  const SearchBody({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }
}

class CategoryBody extends StatelessWidget {
  final Future<List<BrandsModel>> brands;
  final String? selectedBrandId;
  final ValueChanged<String> onTap;

  const CategoryBody({
    super.key,
    required this.brands,
    this.selectedBrandId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<List<BrandsModel>>(
        future: brands,
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
                final isSelected = brand.id == selectedBrandId;

                return GestureDetector(
                  onTap: () => onTap(brand.id),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: isSelected ? Colors.red : Colors.transparent,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      brand.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


