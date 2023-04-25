
import 'package:flutter/material.dart';
/*
void go_to({required context, required Widget widget}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}*/

void go_no_back({
  context,
  widget,
}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}