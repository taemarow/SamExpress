

import 'package:flutter/material.dart';
import 'package:sam_express/const/const.dart';
import 'package:sam_express/screens/login.dart';
import 'package:sam_express/shared/componenets.dart';

class WaitActivation extends StatelessWidget {
  const WaitActivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          lang.wait_activation
        ),
        horizon_big_spacing,
        myButton(
          function: (){
            PageActuel = Login();
          }, 
          text: lang.back
        ),
      ],
    );
  }
}