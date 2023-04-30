
import 'package:flutter/material.dart';
import 'lang/lang.dart';

/*******  language  *******/
late Lang lang ;

/************ phone dimentions ************/
double phoneWhidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
double phoneHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/************* curent page index  **********/
//String PageIndex = 'ListColis';

/************* spacings  *************/
var horizon_spacing = const SizedBox(
  height: 15,
);
var horizon_big_spacing = const SizedBox(
  height: 30,
);
var vertic_spacing = const SizedBox(
  width: 15,
);
var vertic_big_spacing = const SizedBox(
  width: 30,
);