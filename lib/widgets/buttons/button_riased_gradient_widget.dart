import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final Color color;

  const RaisedGradientButton(
      {Key key,
      @required this.child,
      @required this.gradient,
      this.width = double.infinity,
      this.height = 50.0,
      this.onPressed,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: globalRadius,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
          width: width,
          height: _size.height <= 570 ? 45 : 50,
          color: color,
          decoration: BoxDecoration(gradient: gradient),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: onPressed,
                child: Center(
                  child: child,
                )),
          ),
        );
      }),
    );
  }
}
