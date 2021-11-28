import 'dart:io';
import 'package:fast_work_app/widgets/text/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalInputtextField extends StatefulWidget {
  final TextAlign textAlign;
  final TextStyle textStyle;
  final TextInputType textinputType;
  final String text;
  final bool obscure;
  final bool enable;
  final Function onChanged;
  final int maxCharacters;
  final List<TextInputFormatter> inputFormatters;
  final String errorText;
  final Color errorColor;
  final Iterable<String> recomendation;
  final String textPrefix;
  final String textSuffix;

  GlobalInputtextField(
      {@optionalTypeArgs this.textAlign,
      @required this.textStyle,
      @required this.textinputType,
      @required this.text,
      @required this.obscure,
      @required this.onChanged,
      @optionalTypeArgs this.maxCharacters,
      @optionalTypeArgs this.inputFormatters,
      @optionalTypeArgs this.enable,
      @optionalTypeArgs this.errorText,
      @optionalTypeArgs this.errorColor,
      @optionalTypeArgs this.recomendation,
      @optionalTypeArgs this.textPrefix,
      @optionalTypeArgs this.textSuffix});

  @override
  _GlobalInputtextFieldState createState() => _GlobalInputtextFieldState();
}

class _GlobalInputtextFieldState extends State<GlobalInputtextField> {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return Wrap(
      children: [
        MediaQuery(
          data: mqDataNew,
          child: TextField(
            maxLength: widget.maxCharacters,
            enableInteractiveSelection: true,
            style: widget.textStyle,
            obscureText: widget.obscure,
            keyboardType: widget.textinputType,
            cursorColor: Colors.black,
            textAlign: widget.textAlign ?? TextAlign.start,
            autofillHints: Platform.isIOS ? widget.recomendation ?? null : null,
            decoration: InputDecoration(
              suffixText: widget.textSuffix != null ? widget.textSuffix : null,
              isDense: widget.textPrefix != null ? true : false,
              suffixIcon: widget.textPrefix != null
                  ? TextScalableWidget(widget.textPrefix, context: context)
                  : null,
              suffixIconConstraints: widget.textPrefix != null
                  ? BoxConstraints(minWidth: 0, minHeight: 0)
                  : null,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 2.0,
                    color: widget.errorText == null
                        ? Colors.blue
                        : widget.errorText.isEmpty
                            ? Colors.blue
                            : widget.errorColor ?? Colors.blue),
              ),
              contentPadding: EdgeInsets.only(left: 15, top: 10),
              hintText: widget.text,
              counter: widget.errorText == null
                  ? SizedBox()
                  : widget.errorText.isEmpty
                      ? SizedBox(
                          height: 14,
                        )
                      : Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          width: double.infinity,
                          child: TextScalableWidget(
                            widget.errorText,
                            context: context,
                          ),
                        ),
            ),
            onChanged: widget.onChanged,
            enabled: widget.enable,
            inputFormatters:
                widget.inputFormatters == null ? [] : widget.inputFormatters,
          ),
        ),
      ],
    );
  }
}
