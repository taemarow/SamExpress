import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sam_express/shared/componenets.dart';
import 'package:sam_express/style/mycolors.dart';
import '../const/const.dart';
import '../logic/cubit/pass_cubit.dart';
import '../logic/cubit/states.dart';
/*
class Register extends StatelessWidget {
  Register({super.key});

  var PassController = TextEditingController();
  var UserController = TextEditingController();
  var mailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var form2Key = GlobalKey<FormState>();
  

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
                lang.Register,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                lang.Register_label,
                style: Theme.of(context).textTheme.headline2,
              ),

              horizon_big_spacing,

              my_textField(
                controller: UserController,
                hint: lang.user_label,
                sufix_icon: Icons.email,
                validator_text: lang.txtfield_validation_text,
              ),
              Row(
                children: [
                  Text(
                    lang.user_label,
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
          
              Row(
                children: [
                  myTextButton(
                    function: (){
                      myNotification(
                        context: context,
                        title: lang.forgot_pass,
                        content: Form(
                          key: form2Key,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                lang.enterEmail,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              horizon_big_spacing,
                              my_textField(
                                controller: mailController,
                                label: lang.user_label,
                                validator_text: lang.txtfield_validation_text,
                              ),
                              horizon_big_spacing,
                              IconTextButton(
                                text: lang.sendPAss, 
                                bgColor: MyColors.mainColor,
                                iconColor: MyColors.bgColor,
                                icon: Icons.send,
                                function: (){
                                  if(form2Key.currentState!.validate()){

                                  }
                                }
                              ),
                            ],
                          ),
                        )
                      );
                    }, 
                    text: lang.forgot_pass,
                  ),
                ],
              ),
              
              horizon_big_spacing,

              IconTextButton(
                function: (){
                  if(formKey.currentState!.validate()){
                    /****** */
                  }
                },
                icon: Icons.Register,
                iconColor: MyColors.bgColor,
                bgColor: MyColors.mainColor,
                text: lang.Register,
              ),
              horizon_big_spacing,
            ],
          ),
        )
      ),
    );
  }
}*/