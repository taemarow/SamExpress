import 'package:flutter/material.dart';
import 'package:sam_express/const/const.dart';
import 'package:sam_express/shared/componenets.dart';
import 'package:sam_express/logic/methods.dart';
import 'home.dart';

class WaitActivation extends StatelessWidget {
  const WaitActivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
                height: phoneHeight(context) * 15/100,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png" ))
                ),
              ),
        horizon_big_spacing,
        Text(
          lang.wait_activation,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        horizon_big_spacing,
        IconTextButton(
          function: (){
            go_no_back(context: context, widget: Home(childIndex: 'login',));
          }, 
          text: lang.back, 
          icon: Icons.keyboard_arrow_left,
        ),
      ],
    );
  }
}