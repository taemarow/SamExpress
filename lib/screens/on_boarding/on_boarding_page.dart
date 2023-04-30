import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sam_express/screens/home.dart';
import 'package:sam_express/screens/login.dart';
import 'package:sam_express/style/mycolors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../const/const.dart';
import '../../logic/cubit/boarding_cubit.dart';
import '../../logic/cubit/states.dart';
import '../../shared/chache.dart';
import '../../shared/componenets.dart';
import '../../logic/methods.dart';
import 'on_boarding_template.dart';

class on_boardingPage extends StatelessWidget {
 
  List<BoardingTemplate> boarding_list = [
    BoardingTemplate(body: lang.boardingPage_1, title: lang.boardingTitle_1, img: 'assets/logo.png'),
    BoardingTemplate(body: lang.boardingPage_2, title: lang.boardingTitle_2, img: 'assets/logo.png'),
    BoardingTemplate(body: lang.boardingPage_3, title: lang.boardingTitle_3, img: 'assets/logo.png'),
    BoardingTemplate(body: lang.boardingPage_4, title: lang.boardingTitle_4, img: 'assets/logo.png'),
  ];

  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => boarding_cubit(),
      child: BlocConsumer<boarding_cubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = boarding_cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              actions: [
                myTextButton(
                  function: () {
                    go_no_back( widget: Home(childIndex: 'login'), context: context);
                    Cache.saveBool(key: 'skip_onBoarding', value: true);
                  },
                  text: 'Skip',
                  color: MyColors.red
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: ((value) {
                        cubit.changeBoardPage(value);
                      }),
                      physics: const BouncingScrollPhysics(),
                      controller: boardController,
                      itemBuilder: (context, index) =>
                          boarding_item(boarding_list[index]),
                      itemCount: boarding_list.length,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: boardController,
                        count: boarding_list.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: MyColors.mainColor,
                          dotColor: MyColors.mainColor_clair,
                        ),
                      ),
                      const Spacer(),
                      FloatingActionButton(
                        heroTag: 'onBoarding',
                        onPressed: () {
                          if (cubit.boarding_index ==
                              boarding_list.length - 1) {
                            Cache.saveBool(key: 'skip_onBoarding', value: true)
                                .then((value) {
                              go_no_back( context: context, widget: Home(childIndex: 'login'));
                            });
                          } else {
                            boardController.nextPage(
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          }
                        },
                        child: const Icon(Icons.navigate_next),
                        backgroundColor: MyColors.bgColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    /*********/
  }

  Widget boarding_item(BoardingTemplate board) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(board.img),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          board.title,
          style: const TextStyle(
            fontSize: 24,
            //fontWeight: FontWeight.bold,
            //fontFamily: 'myFont',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          board.body,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
