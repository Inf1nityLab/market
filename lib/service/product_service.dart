

import 'package:marketplace/model%20/tyre_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService {
  final SupabaseClient client = Supabase.instance.client;

  Future<List<Product>> getProducts() async{
    try {
      final response = await client.from('products1').select();

      return response.map((e) => Product.fromJson(e)).toList();
    } catch(e){
      throw e;
    }
    }


}