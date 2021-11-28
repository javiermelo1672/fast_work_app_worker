import 'package:flutter/material.dart';

class TextScalableWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final double textScaleFactor;
  final BuildContext context;
  // ignore: invalid_required_positional_param
  TextScalableWidget(@required this.text,
      {@optionalTypeArgs this.style,
      @optionalTypeArgs this.textAlign,
      @optionalTypeArgs this.overflow,
      @optionalTypeArgs this.maxLines,
      @optionalTypeArgs this.textScaleFactor,
      @required this.context});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      textScaleFactor:
          textScaleFactor ?? 1.0, //This line is necessary for set TextSizeç
    );
  }
}
