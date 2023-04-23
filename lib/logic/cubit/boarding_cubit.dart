
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class boarding_cubit extends Cubit<States> {
  boarding_cubit() : super(initial_state());
  static boarding_cubit get(context) => BlocProvider.of(context);

  //bool last_elem = false;
  int boarding_index = 0;
  void changeBoardPage(int i) {
    boarding_index = i;
    emit(change_boarding_state());
  }
}
