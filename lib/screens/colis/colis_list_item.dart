

import 'package:flutter/material.dart';
import 'package:sam_express/const/const.dart';
import 'package:sam_express/modules/colis.dart';
import 'package:sam_express/shared/componenets.dart';
import 'package:sam_express/style/mycolors.dart';

class ColiItem extends StatelessWidget {
  ColiItem({super.key, required this.coli});
  Colis coli ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(47, 143, 173, 180),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.phone, color: MyColors.bgColor, size: 17,),
              Text(
                '0${coli.phoneReceiver}',
                style: Theme.of(context).textTheme.headline1,
              ),
              const Spacer(),
              Text(
                '${coli.prix} Da',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          horizon_spacing,
          Text(
            coli.receiver,
            style: Theme.of(context).textTheme.bodyText1
          ),
          horizon_spacing,
          IconTextButton(
            function: (){}, 
            text: lang.confirm, 
            icon: Icons.check
          ),
        ],
      ),
    );
  }
}