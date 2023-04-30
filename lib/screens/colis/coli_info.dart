
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sam_express/screens/my_drawer.dart';
import '../../const/const.dart';
import '../../logic/cubit/appbar_cubit.dart';
import '../../logic/cubit/states.dart';
import '../../modules/colis.dart';
import '../../shared/chache.dart';
import '../../shared/componenets.dart';
import '../../style/mycolors.dart';

class ColiInfo extends StatelessWidget {
  ColiInfo({
    super.key,
    required this.colis,
  });
  Colis colis ;
  late appBarCubit cubit;

  @override
  Widget build(BuildContext context) {
  double prix, poids;

  return BlocConsumer<appBarCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {

        cubit = appBarCubit.get(context);

        return Directionality( 
          textDirection: cubit.textDirection,
          child: Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
                  title: Text(colis.id),
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
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10, top: 25, right: 5, bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.colisInfo,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                    height: 1,
                    width: phoneWhidth(context),
                    color: MyColors.lightGrey,
                  ),

                  horizon_spacing, 
                  RichText(
                    text: TextSpan(
                      text: '${lang.prix} : ',
                      style: Theme.of(context).textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(text: '${colis.prix} Da', style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                  horizon_spacing, 
                  RichText(
                    text: TextSpan(
                      text: '${lang.poids} : ',
                      style: Theme.of(context).textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(text: '${colis.poids} g', style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),

                  horizon_big_spacing,

                  Text(
                    lang.infoReceiver,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                    height: 1,
                    width: phoneWhidth(context),
                    color: MyColors.lightGrey,
                  ),

                  horizon_spacing, 
                  RichText(
                    text: TextSpan(
                      text: '${lang.name_label} : ',
                      style: Theme.of(context).textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(text: colis.receiver, style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                  horizon_spacing, 
                  RichText(
                    text: TextSpan(
                      text: '${lang.adress_label} : ',
                      style: Theme.of(context).textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(text: colis.adressReceiver, style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                  horizon_spacing, 
                  RichText(
                    text: TextSpan(
                      text: '${lang.phone_label} : ',
                      style: Theme.of(context).textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(text: colis.phoneReceiver, style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),

                  horizon_big_spacing,

                  Text(
                    lang.infoSender,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                    height: 1,
                    width: phoneWhidth(context) ,
                    color: MyColors.lightGrey,
                  ),

                  horizon_spacing, 
                  RichText(
                    text: TextSpan(
                      text: '${lang.name_label} : ',
                      style: Theme.of(context).textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(text: colis.sender, style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                  horizon_spacing, 
                  RichText(
                    text: TextSpan(
                      text: '${lang.adress_label} : ',
                      style: Theme.of(context).textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(text: colis.adressSender, style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                  horizon_spacing, 
                  RichText(
                    text: TextSpan(
                      text: '${lang.phone_label} : ',
                      style: Theme.of(context).textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(text: colis.phoneSender, style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),

                  horizon_big_spacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconTextButton(
                        function: (){}, 
                        text: lang.confirm, 
                        icon: Icons.check
                      ),
                    ],
                  )
                  
                ],
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