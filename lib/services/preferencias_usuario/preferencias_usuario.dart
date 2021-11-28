import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    WidgetsFlutterBinding.ensureInitialized();
    this._prefs = await SharedPreferences.getInstance();
  }

  get name {
    return _prefs.getString("name") ?? "--";
  }

  set name(String name) {
    _prefs.setString(
        "name", name != "" && name != null && name != "null" ? name : "--");
  }

  get id {
    return _prefs.getString("id") ?? "--";
  }

  set id(String id) {
    _prefs.setString("id", id != "" && id != null && id != "null" ? id : "--");
  }

  get email {
    return _prefs.getString("email") ?? "--";
  }

  set email(String email) {
    _prefs.setString("email",
        email != "" && email != null && email != "null" ? email : "--");
  }

  get profilePhoto {
    return _prefs.getString("profilePhoto") ?? "--";
  }

  set profilePhoto(String profilePhoto) {
    _prefs.setString(
        "profilePhoto",
        profilePhoto != "" && profilePhoto != null && profilePhoto != "null"
            ? profilePhoto
            : "--");
  }

  set description(String description) {
    _prefs.setString(
        "description",
        description != "" && description != null && description != "null"
            ? description
            : "--");
  }

  get description {
    return _prefs.getString("description") ?? "--";
  }
}
