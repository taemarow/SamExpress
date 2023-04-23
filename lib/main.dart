import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sam_express/const/const.dart';
import 'package:sam_express/screens/home.dart';
import 'const/lang/ar.dart';
import 'const/lang/eng.dart';
import 'const/lang/fr.dart';
import 'logic/cubit/states.dart';
import 'logic/cubit/appbar_cubit.dart';
import 'screens/login.dart';
import 'screens/on_boarding/on_boarding_page.dart';
import 'screens/wait_activation.dart';
import 'shared/chache.dart';
import 'style/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Cache.init();
  String? token = Cache.get_cache(key: 'token');
  bool dark = Cache.get_cache(key: 'theme') ?? true;
  bool onBoarding_is_Seen = Cache.get_cache(key: 'skip_onBoarding') ?? false;

  String l = Cache.get_cache(key: 'lang') ?? null;
  switch(l){
    case 'ENG': lang = ENG();
      break;
    case 'FR': lang = FR();
      break;
    case 'AR': lang = AR();
      break;
    default: lang = AR();
  }

  if (token != null) {
    PageActuel = Login();
  } else {
    PageActuel = const WaitActivation();
  }


  runApp( MyApp(
    theme_is_dark: dark,
    skip: onBoarding_is_Seen,
  ));
}

class MyApp extends StatelessWidget {
  
  late bool theme_is_dark;
  late bool skip;
  MyApp({
    required this.theme_is_dark,
    required this.skip,
  });

  @override
  Widget build(BuildContext context) {

    return BlocProvider( 
      create: (context) => appBarCubit(),
      child: BlocConsumer<appBarCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appBarCubit.get(context);

          var theme = cubit.themeDark ? ThemeMode.dark : ThemeMode.light;
          
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: theme,
            home: skip ? Home() : on_boardingPage(),
          );
        },
      ),
    );

  }
}