import 'package:fast_work_app/pages/auth/login.dart';
import 'package:fast_work_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'services/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  final PreferenciasUsuario _preferenciasUsuario = PreferenciasUsuario();
  await _preferenciasUsuario.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PreferenciasUsuario _preferenciasUsuario = new PreferenciasUsuario();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fast Work APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _preferenciasUsuario.id != "--" && _preferenciasUsuario.id != null
          ? HomePage()
          : Login(),
    );
  }
}
