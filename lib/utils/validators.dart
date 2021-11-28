import 'dart:async';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Más de 6 caracteres por favor');
    }
  });

  final validarName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name != null && name != "") {
      sink.add(name);
    } else {
      sink.addError('No puede estar vacío');
    }
  });

  final validarlastName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name != null && name != "") {
      sink.add(name);
    } else {
      sink.addError('No puede estar vacío');
    }
  });

  final validarCC = StreamTransformer<String, String>.fromHandlers(
      handleData: (document, sink) {
    if (document != null && document.length >= 7) {
      sink.add(document);
    } else if (document == null) {
      sink.addError('No puede estar vacío');
    } else if (document.length < 7) {
      sink.addError('Requiere más de 7 números');
    }
  });

  final validarTypedoc = StreamTransformer<String, String>.fromHandlers(
      handleData: (typecDoc, sink) {
    if (typecDoc != 'Tipo') {
      sink.add(typecDoc);
    } else if (typecDoc == null) {
      sink.addError('Seleccione un tipo de documento');
    }
  });

  final validarphone =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (phone != null && phone.length >= 7) {
      sink.add(phone);
    } else if (phone == null) {
      sink.addError('No puede estar vacío');
    }
  });

  final validAcceptCondition =
      StreamTransformer<bool, bool>.fromHandlers(handleData: (accept, sink) {
    accept ? sink.add(accept) : sink.addError("Debe aceptar los términos");
  });

  final validGender = StreamTransformer<String, String>.fromHandlers(
      handleData: (gender, sink) {
    if (gender != "") {
      sink.add(gender);
    } else if (gender == "" || gender == null) {
      sink.addError('Seleccione un género');
    }
  });

  bool validatePassword(String password) {
    if (password.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  bool validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }
}
