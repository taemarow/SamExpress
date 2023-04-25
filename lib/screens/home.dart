
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sam_express/const/const.dart';
import 'package:sam_express/screens/wait_activation.dart';
import '../logic/cubit/states.dart';
import '../logic/cubit/appbar_cubit.dart';
import '../shared/chache.dart';
import '../style/mycolors.dart';
import 'colis/coli_info.dart';
import 'colis/list_colis.dart';
import 'login.dart';
import 'register.dart';

class Home extends StatelessWidget {
  Home({super.key, required this.childIndex});
  late appBarCubit cubit;
  late String childIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appBarCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        Map<String, Widget> widgets = {
          'login': Login(), 
          'register': Register(), 
          'WaitActivation': const WaitActivation(),
          'ListColis' : ListColis(),
          'ColiInfo' : ColiInfo(),
        };
        cubit = appBarCubit.get(context);
        return Scaffold(
          floatingActionButton:  childIndex == 'ListColis'? 
            FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.add, color: MyColors.lightTheme,),
              //backgroundColor: MyColors.mainColor,
            )
            : null,
          appBar: AppBar(
                //elevation: elevation?? 0,
                //leading: 
                title: Text(lang.appBar_title),
                actions: [
                  
                  SizedBox(
                    width: 60,
                    child: languageList(),
                  ) ,
                  
                  IconButton(
                    onPressed: () {
                      cubit.changeTheme();
                    },
                    icon: cubit.themeDark
                        ? const Icon(Icons.sunny, )
                        : const Icon(Icons.nightlight,),
                  ),
                ],
              ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: widgets[childIndex],
          ),
          bottomSheet: Center(
            heightFactor: 2,
            child: Text(
              lang.sam_express_rights,
              style: TextStyle(
                fontSize: 12,
                color: MyColors.grey
              ),
            ),
          ),
        );
      }
    );
  }


  Widget languageList()=>DropdownButtonFormField(
      style: TextStyle(color: MyColors.lightTheme),
      dropdownColor: MyColors.mainColor,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: MyColors.lightTheme),
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: MyColors.lightTheme,
          size: 25,
        ),
        value: cubit.selectedLang,
        items: cubit.Languages,
        onChanged: (value) {
          cubit.selectedLang = value!.toString();
          cubit.changeLang();
          Cache.saveString(key: 'lang', value: value.toString());
        },
        onSaved: (newValue) {
          //************************** */
        },
        isExpanded: true,
  );
}