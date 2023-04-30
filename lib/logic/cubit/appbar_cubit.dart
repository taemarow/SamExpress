
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../const/const.dart';
import '../../const/lang/ar.dart';
import '../../const/lang/eng.dart';
import '../../const/lang/fr.dart';
import '../../shared/chache.dart';
import 'states.dart';

class appBarCubit extends Cubit<States> {

  appBarCubit() : super(initial_state());
  static appBarCubit get(context) => BlocProvider.of(context);

  bool themeDark = Cache.get_cache(key: 'theme') ?? false;
  void changeTheme() {
    themeDark = !themeDark;
    Cache.saveBool(key: 'theme', value: themeDark);
    emit(change_theme_state());
  }

  String selectedLang = Cache.get_cache(key: 'lang') ?? 'AR';
  List<DropdownMenuItem<String>> Languages= [
    DropdownMenuItem(value: 'ENG', child: Text('ENG',overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: 16,),)),
    DropdownMenuItem(value: 'FR', child: Text('FR',overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: 16,),)),
    DropdownMenuItem(value: 'AR', child: Text('AR',overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: 16),)),
  ];
  TextDirection textDirection = consTtextDirection;
  
  void changeLang(){
    switch(selectedLang){
      case 'ENG': lang = ENG();
        textDirection = TextDirection.ltr;
        break;
      case 'FR': lang = FR();
        textDirection = TextDirection.ltr;
        break;
      case 'AR': lang = AR();
        textDirection = TextDirection.rtl;
        break;
      default: lang = AR();
        textDirection = TextDirection.rtl;
    }
    emit(change_theme_state());
  }

}