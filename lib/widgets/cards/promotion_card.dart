import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: globalRadius,
        child: Container(
          height: 300,
          color: grey,
        ));
  }
}
