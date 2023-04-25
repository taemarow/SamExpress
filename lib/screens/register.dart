import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sam_express/shared/componenets.dart';
import 'package:sam_express/style/mycolors.dart';
import '../const/const.dart';
import '../logic/cubit/pass_cubit.dart';
import '../logic/cubit/states.dart';
import '../logic/methods.dart';
import 'home.dart';

class Register extends StatelessWidget {
  Register({super.key});

  var PassController = TextEditingController();
  var PhoneController = TextEditingController();
  var AdressController = TextEditingController();
  var mailController = TextEditingController();
  var nameController = TextEditingController();
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

              Container(
                height: phoneHeight(context) * 10/100,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png" ))
                ),
              ),
              horizon_spacing,

              Text(
                lang.register,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                lang.register_label,
                style: Theme.of(context).textTheme.headline2,
              ),

              horizon_big_spacing,

              my_textField(
                controller: mailController,
                hint: lang.user_label,
                sufix_icon: Icons.email,
                validator_text: lang.txtfield_validation_text,
                keyboardType: TextInputType.emailAddress
              ),
              Row(
                children: [
                  Text(
                    lang.user_label,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ]),

              horizon_big_spacing,

              my_textField(
                controller: nameController,
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

              horizon_big_spacing,
              my_textField(
                controller: PhoneController,
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

              my_textField(
                controller: AdressController,
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

              horizon_big_spacing,
              
              BlocProvider(
                create: (context) => PassCubit(),
                child: BlocConsumer<PassCubit, States>(
                  builder: (context, state) {

                    var cubit = PassCubit.get(context);

                    return my_textField(
                      validator_text: lang.txtfield_validation_text,
                      invisible: cubit.hiden,
                      controller: PassController,
                      hint: lang.pass_label,
                      sufix_icon: cubit.hiden? Icons.remove_red_eye : Icons.visibility_off,
                      sufix_fuction: (){
                        cubit.changeVisibility();
                      }
                    );
                  }, 
                  listener: (context, state) { },
                ),
              ),
              
              Row(
                children: [
                Text(
                  lang.pass_label
                ),
              ]),

              horizon_spacing,
              
              horizon_big_spacing,

              IconTextButton(
                function: (){
                  if(formKey.currentState!.validate()){
                    go_no_back(context: context, widget: Home(childIndex: 'WaitActivation'));
                  }
                },
                icon: Icons.person_add,
                iconColor: MyColors.bgColor,
                bgColor: MyColors.mainColor,
                text: lang.register,
              ),

              myTextButton(
                function: (){
                  go_no_back(context: context, widget: Home(childIndex: 'login'));
                }, 
                text: lang.login,
                color: MyColors.red
              ),

              horizon_big_spacing,
            ],
          ),
        )
      ),
    );
  }
}