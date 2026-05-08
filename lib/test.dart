
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
 
  
  // Чтение
  // Здесь или будущее  - void
  // Одно или много - List 
  // Один тип данных или каша - Тип - class model
  

  // <List<String>> getReviews() async {
  //   try {
  //     final response = await Supabase.instance.client.from('review').select('description');
  //     return List.from(response);
  //
  //   } catch (e){
  //     throw Exception('Неизвестная ошибка');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}



