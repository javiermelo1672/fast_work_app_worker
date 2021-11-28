import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:fast_work_app/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

void showLocalScaffoldMessage(
    {@required String message,
    @required BuildContext context,
    @optionalTypeArgs IconData icon,
    @optionalTypeArgs Color backgroundColor,
    @optionalTypeArgs Color textColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: backgroundColor ?? Colors.black,
    duration: Duration(milliseconds: 700),
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.signal_cellular_off,
          color: white,
        ),
        SizedBox(
          width: 10,
        ),
        TextScalableWidget(
          message ?? "Error",
          context: context,
        )
      ],
    ),
  ));
}
