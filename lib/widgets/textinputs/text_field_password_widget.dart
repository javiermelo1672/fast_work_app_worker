import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:fast_work_app/widgets/text/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalInputPasswordField extends StatefulWidget {
  final TextAlignVertical textAlign;
  final TextStyle textStyle;
  final TextInputType textinputType;
  final String text;
  final bool enable;
  final Function onChanged;
  final String errorText;
  final Color errorColor;

  GlobalInputPasswordField(
      {@required this.textAlign,
      @required this.textStyle,
      @required this.textinputType,
      @required this.text,
      @required this.onChanged,
      this.enable,
      @optionalTypeArgs this.errorText,
      @optionalTypeArgs this.errorColor});

  @override
  _GlobalInputPasswordFieldState createState() =>
      _GlobalInputPasswordFieldState();
}

class _GlobalInputPasswordFieldState extends State<GlobalInputPasswordField> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return MediaQuery(
      data: mqDataNew,
      child: TextField(
          maxLength: 100,
          enableInteractiveSelection: true,
          style: widget.textStyle,
          obscureText: isObscurePassword,
          keyboardType: widget.textinputType,
          cursorColor: Colors.black,
          decoration: InputDecoration(
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
            suffixIcon: GestureDetector(
              child: isObscurePassword
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: blackGlobal,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Icon(
                        Icons.visibility_off_outlined,
                        color: blackGlobal,
                      ),
                    ),
              onTap: _showOrHidePassword,
            ),
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
          inputFormatters: []),
    );
  }

  // Show or Hide password
  void _showOrHidePassword() {
    setState(() {
      isObscurePassword = !isObscurePassword;
    });
  }
}
