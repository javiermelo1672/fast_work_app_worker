import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class StarIndicator extends StatelessWidget {
  final double rate;
  StarIndicator({@required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, size: 20, color: yellowColor),
        Text(
          rate != null ? rate.toStringAsFixed(1) : "4.8",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: blackGlobal),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ],
    );
  }
}
