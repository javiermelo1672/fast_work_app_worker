import 'package:flutter/material.dart';

Widget progressCircularBar(
    {@optionalTypeArgs double height, @optionalTypeArgs double width}) {
  return Center(
    child: Container(
      height: height ?? 40,
      width: width ?? 40,
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );
}
