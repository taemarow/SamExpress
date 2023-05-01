import 'package:flutter/material.dart';
import 'package:sam_express/shared/componenets.dart';
import 'package:sam_express/style/mycolors.dart';
import '../../const/const.dart';

class NewColis extends StatelessWidget {
  NewColis({super.key});

  var senderController = TextEditingController();
  var senderPhoneController = TextEditingController();
  var senderAdressController = TextEditingController();
  var receiverController = TextEditingController();
  var receiverPhoneController = TextEditingController();
  var prixController = TextEditingController();
  var receiverAdressController = TextEditingController();
  var poidsController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Text(
                lang.infoSender,
                style: Theme.of(context).textTheme.headline2,
              ),
              my_textField(
                controller: senderController,
                hint: lang.name_label,
                sufix_icon: Icons.send,
                validator_text: lang.txtfield_validation_text,
              ),
              Row(
                children: [
                  Text(
                    lang.name_label,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ]),

              horizon_spacing,

              my_textField(
                controller: senderAdressController,
                hint: lang.adress_label,
                sufix_icon: Icons.home,
                validator_text: lang.txtfield_validation_text,
              ),
              Row(
                children: [
                  Text(
                    lang.adress_label,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ]),

              horizon_spacing,
              my_textField(
                controller: senderPhoneController,
                hint: lang.phone_label,
                sufix_icon: Icons.phone,
                validator_text: lang.txtfield_validation_text,
                keyboardType: TextInputType.phone
              ),
              Row(
                children: [
                  Text(
                    lang.phone_label,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ]),

              horizon_big_spacing,
              Text(
                lang.infoReceiver,
                style: Theme.of(context).textTheme.headline2,
              ),

              horizon_spacing,
              my_textField(
                controller: receiverController,
                hint: lang.name_label,
                sufix_icon: Icons.person,
                validator_text: lang.txtfield_validation_text,
              ),
              Row(
                children: [
                  Text(
                    lang.name_label,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ]),
                horizon_spacing,

              my_textField(
                controller: receiverAdressController,
                hint: lang.adress_label,
                sufix_icon: Icons.home,
                validator_text: lang.txtfield_validation_text,
              ),
              Row(
                children: [
                  Text(
                    lang.adress_label,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ]),

              horizon_spacing,
              my_textField(
                controller: receiverPhoneController,
                hint: lang.phone_label,
                sufix_icon: Icons.phone,
                validator_text: lang.txtfield_validation_text,
                keyboardType: TextInputType.phone
              ),
              Row(
                children: [
                  Text(
                    lang.phone_label,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ]),

              
              horizon_big_spacing,

              Text(
                lang.colisInfo,
                style: Theme.of(context).textTheme.headline2,
              ),
              horizon_spacing,
              my_textField(
                controller: senderController,
                hint: lang.poids,
                sufix_icon: Icons.balance,
                validator_text: lang.txtfield_validation_text,
                keyboardType: TextInputType.number
              ),
              Row(
                children: [
                  Text(
                    lang.poids,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ]),

              horizon_spacing,

              my_textField(
                controller: prixController,
                hint: lang.prix,
                sufix_icon: Icons.attach_money,
                validator_text: lang.txtfield_validation_text,
                keyboardType: TextInputType.number
              ),
              Row(
                children: [
                  Text(
                    lang.prix,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ]),

                horizon_big_spacing,

              IconTextButton(
                function: (){
                  if(formKey.currentState!.validate()){
                    
                  }
                },
                icon: Icons.save,
                iconColor: MyColors.bgColor,
                bgColor: MyColors.mainColor,
                text: lang.confirm,
              ),

            ],
          ),
        )
      ),
    );
  }
}