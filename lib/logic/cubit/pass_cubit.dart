import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class PassCubit extends Cubit<States> {

  PassCubit() : super(initial_state());
  static PassCubit get(context) => BlocProvider.of(context);

  bool hiden = true;
  void changeVisibility() {
    hiden = !hiden;
    emit(change_visibility_state());
  }
}