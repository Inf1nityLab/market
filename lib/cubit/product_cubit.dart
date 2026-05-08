import 'package:bloc/bloc.dart';
import 'package:marketplace/service/nurjigit_service.dart';
import 'package:marketplace/service/product_service.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {

  final NurjigitService _service;

  ProductCubit(this._service) : super(ProductInitial());

  void addProduct({required String food, required double price})  async{
    try {
      emit(ProductLoading());
      final products = await _service.addFood(food: food, price: price);
      emit(ProductSuccess());
    }
     catch (e){
      emit(ProductError());
     }
  }

  void getProducts() async {
    try {
      emit(ProductLoading());
      final products = await _service.getFood();
      emit(ProductSuccess());
    } catch (e) {
      emit(ProductError());
    }
  }

  void deleteProduct({required String id}) async {
    try{
      emit(ProductLoading());
      await _service.deleteFood(id: id);
      emit(ProductSuccess());
    } catch(e){
      emit(ProductError());
    }
  }

  void updateProduct({required String food, required double price, required String id}) async {
    try{
      emit(ProductLoading());
      await _service.updateFood(food: food, price: price, id: id);
      emit(ProductSuccess());
    } catch (e) {
      emit(ProductError());
    }
  }


}
