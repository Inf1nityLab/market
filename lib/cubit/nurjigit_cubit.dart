import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nurjigit_state.dart';

class NurjigitCubit extends Cubit<NurjigitState> {
  NurjigitCubit() : super(NurjigitInitial());
}
