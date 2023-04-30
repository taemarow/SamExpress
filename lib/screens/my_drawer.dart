
import 'package:flutter/material.dart';
import 'package:sam_express/const/const.dart';
import 'package:sam_express/logic/methods.dart';
import 'package:sam_express/modules/user.dart';
import 'package:sam_express/screens/home.dart';
import 'package:sam_express/shared/chache.dart';
import 'package:sam_express/style/mycolors.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

 List <String> items = [lang.listColis, lang.listScan, lang.listPayment, lang.Statics, lang.Logout];
 List <IconData> icons = [Icons.list, Icons.qr_code_scanner, Icons.attach_money, Icons.bar_chart, Icons.logout];
 List <String> widgets = ['ListColis', 'ScanList', 'ListPay', 'Status', 'Logout'];

  @override
  Widget build(BuildContext context) {
    User user = User(adress: 'adress', email: 'email@gmail.com', name: 'name', 
                      password: 'password', phone: '0557846532', role: 'superviseur');

    double size = phoneWhidth(context)*80/100;
    return Drawer(
      width: size,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.apartment, size: 50),
            Text(
              '${lang.desk} batna',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            horizon_spacing,
            Container(
              height: 1,
              color: MyColors.lightGrey,
              width: double.infinity,
            ),
            horizon_spacing,
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 182, 77, 201),
              ),
              child: Text(
                user.role,
                style: const TextStyle(
                  color: Colors.white,
                )
              ),
            ),
            horizon_spacing,
            Container(
              height: 1,
              color: MyColors.lightGrey,
              width: double.infinity,
            ),

            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              itemBuilder: (context, index) => InkWell(
                child: Row(
                  children: [
                    Icon(icons[index], size: 35),
                    const SizedBox(width: 20,),
                    Text(
                      items[index], 
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                onTap: (){
                  if(index == 4){
                    Cache.supp(key: 'token');
                    go_no_back(context: context, widget: Home(childIndex: 'login'));
                  }else {
                    go_no_back(context: context, widget: Home(childIndex: widgets[index]));
                  }
                },
              ),
              separatorBuilder: (context, index) => horizon_big_spacing,
              itemCount: items.length, 
            ),
          ],
        ),
      ),
      
    );
  }
}
