import 'package:flutter/material.dart';
import 'package:marketplace/shared/circle_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/brands_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<BrandsModel>> brands;

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

    return (response as List).map((brand) => BrandsModel.fromJson(brand)).toList();
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

      body: FutureBuilder<List<BrandsModel>>(
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
    );
  }
}
