import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sam_express/const/const.dart';
import 'package:sam_express/screens/home.dart';
import 'const/lang/ar.dart';
import 'const/lang/eng.dart';
import 'const/lang/fr.dart';
import 'logic/cubit/states.dart';
import 'logic/cubit/appbar_cubit.dart';
import 'screens/on_boarding/on_boarding_page.dart';
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
      consTtextDirection = TextDirection.ltr;
      break;
    case 'FR': lang = FR();
      consTtextDirection = TextDirection.ltr;
      break;
    case 'AR': lang = AR();
      consTtextDirection = TextDirection.rtl;
      break;
    default: lang = AR();
      consTtextDirection = TextDirection.rtl;
  }

Widget PageActuel;
  if(onBoarding_is_Seen)
    // ignore: curly_braces_in_flow_control_structures
    if (token == null) {
      PageActuel = Home(childIndex: 'login');
    } else {
      PageActuel = Home(childIndex: 'ListColis',);
    }
  else {
    PageActuel = on_boardingPage();
  }


  runApp( MyApp(
    theme_is_dark: dark,
    firstPage: PageActuel,
  ));
}

class MyApp extends StatelessWidget {
  
  late bool theme_is_dark;
  late Widget firstPage;
  MyApp({
    required this.theme_is_dark,
    required this.firstPage,
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
            home: firstPage,
          );
        },
      ),
    );

  }
}
