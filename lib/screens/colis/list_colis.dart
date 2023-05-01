
import 'package:flutter/material.dart';
import 'package:sam_express/const/const.dart';
import 'package:sam_express/logic/methods.dart';
import 'package:sam_express/modules/colis.dart';
import 'package:sam_express/screens/colis/coli_info.dart';
import 'package:sam_express/screens/colis/colis_list_item.dart';
import 'package:sam_express/shared/componenets.dart';

class ListColis extends StatelessWidget {
  ListColis({super.key});

  var searchController = TextEditingController();

  List colis = [
    Colis(adressReceiver: 'constantine', adressSender: 'batna', id: '0124Pm6', phoneReceiver: '054512644', phoneSender: '064578411', poids: 1, prix: 400, receiver: 'houcine', sender: 'aya'),
    Colis(adressReceiver: 'chlef', adressSender: 'oran', id: '0101260', phoneReceiver: '072512644', phoneSender: '064578411', poids: 1, prix: 450, receiver: 'chamsou', sender: 'zinou'),
    Colis(adressReceiver: 'alger', adressSender: 'setif', id: '0124698', phoneReceiver: '054512644', phoneSender: '064578411', poids: 1, prix: 300, receiver: 'foufou', sender: 'islam'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          my_textField(
            controller: searchController,
            label: lang.search,
            sufix_icon: Icons.search,
            sufix_fuction: (){}
          ),
          horizon_spacing,
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              child: ColiItem(coli: colis[index]),
              onTap: () => go_no_back(context: context, widget: ColiInfo(colis: colis[index])),
            ), 
            separatorBuilder: (context, index) => horizon_spacing, 
            itemCount: colis.length
          ),
          
          horizon_big_spacing,
          
        ],
      ),
    );
  }
}