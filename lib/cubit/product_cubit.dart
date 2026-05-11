import 'package:bloc/bloc.dart';
import 'package:marketplace/model%20/tyre_model.dart';
import 'package:meta/meta.dart';

import '../service/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductService _productService ;

  ProductCubit(this._productService) : super(ProductInitial());


  void getProducts() async {
    try{
      emit(ProductLoading());
      final data = await _productService.getProducts();
      emit(ProductSuccess(data: data));
    } catch (e){
      emit(ProductError(message: 'НЕ смогли загрузить данные $e'));
    }
  }
}
