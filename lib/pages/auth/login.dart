import 'package:fast_work_app/pages/auth/sign_up.dart';
import 'package:fast_work_app/pages/home/home_page.dart';
import 'package:fast_work_app/services/data_post_services.dart';
import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:fast_work_app/utils/show_scaffold_message.dart';
import 'package:fast_work_app/utils/validators.dart';
import 'package:fast_work_app/widgets/buttons/button_riased_gradient_widget.dart';
import 'package:fast_work_app/widgets/text/text_widget.dart';
import 'package:fast_work_app/widgets/textinputs/text_field_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Validators _validators = Validators();

  String _email = "";
  String _password = "";
  DataPostService _dataPostService = DataPostService();

  bool _loadPost = false;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: _createForm(_size),
      )),
    );
  }

  Widget _createForm(Size size) {
    final List<Widget> _listOfItems = _listOfWidgets(size, context);

    return ListView.builder(
        //physics: NeverScrollableScrollPhysics(),
        itemCount: _listOfItems.length,
        itemBuilder: (context, index) {
          return _listOfItems[index];
        });
  }

  List<Widget> _listOfWidgets(Size size, BuildContext context) {
    return [
      SizedBox(
        height: 15,
      ),
      Container(
        height: 55,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage("assets/logo.png"))),
      ),
      SizedBox(
        height: 5,
      ),
      TextScalableWidget(
        "EMPLEADO",
        context: context,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: mainColor),
      ),
      SizedBox(
        height: size.height * 0.2,
      ),
      GlobalInputtextField(
        obscure: false,
        onChanged: (value) {
          setState(() {
            _email = value;
          });
        },
        text: 'Email',
        textStyle: null,
        textinputType: TextInputType.emailAddress,
      ),
      SizedBox(
        height: 10,
      ),
      GlobalInputtextField(
        obscure: true,
        onChanged: (value) {
          setState(() {
            _password = value;
          });
        },
        text: 'Contraseña',
        textinputType: null,
        textStyle: null,
      ),
      SizedBox(
        height: 10,
      ),
      !_loadPost
          ? RaisedGradientButton(
              gradient: LinearGradient(
                colors: _validateForm()
                    ? <Color>[secondaryColor, mainColor]
                    : <Color>[grey, grey],
              ),
              child: TextScalableWidget(
                '¡A TRABAJAR!',
                context: context,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: _validateForm()
                  ? () async {
                      setState(() {
                        _loadPost = true;
                      });
                      Map<String, dynamic> response =
                          await _dataPostService.login(
                        _email,
                        _password,
                        "Empleado",
                      );
                      setState(() {
                        _loadPost = false;
                      });

                      if (response['ok']) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      } else {
                        showLocalScaffoldMessage(
                          message: response['mensaje'],
                          context: context,
                        );
                      }
                    }
                  : null,
            )
          : Center(child: CircularProgressIndicator()),
      SizedBox(
        height: 20,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUp()));
        },
        child: TextScalableWidget(
          "¿Aún no haces parte?",
          context: context,
          textAlign: TextAlign.center,
        ),
      )
    ];
  }

  bool _validateForm() {
    if (_validators.validateEmail(_email) &&
        _validators.validatePassword(_password)) {
      return true;
    } else {
      return false;
    }
  }
}
