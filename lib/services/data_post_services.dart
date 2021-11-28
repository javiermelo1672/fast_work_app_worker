import 'package:dio/dio.dart';
import 'package:fast_work_app/gobal/global_endpoints.dart';
import 'package:fast_work_app/models/users_data_model.dart';
import 'package:fast_work_app/services/preferencias_usuario/preferencias_usuario.dart';

class DataPostService {
  Dio _dioPost = new Dio();
  final PreferenciasUsuario _preferenciasUsuario = PreferenciasUsuario();
  //fucntion to create a user with dio
  Future<Map<String, dynamic>> createUser(UserData userData) async {
    Map<String, String> _body = {
      "id": userData.id,
      "name": userData.name,
      "profile_photo": userData.profilePhoto,
      "type": userData.type,
      "gender": userData.gender,
      "document_type": userData.documentType,
      "document": userData.document,
      "email": userData.email,
      "password": userData.password,
      "phone": userData.phone,
      "status": userData.status,
      "vehicle": userData.vehicle,
      "description": userData.description,
    };

    final Response resp =
        await _dioPost.post(endPoint + createUserFastWork, data: _body);
    try {
      Map<String, dynamic> decodeResp = resp.data;
      if (decodeResp['message'] == "OK") {
        _preferenciasUsuario.email = userData.email;
        _preferenciasUsuario.name = userData.name;
        _preferenciasUsuario.profilePhoto = userData.profilePhoto;
        _preferenciasUsuario.id = decodeResp['id'];
        _preferenciasUsuario.description = userData.description;
        return {'ok': true, 'mensaje': decodeResp['user_message']};
      } else {
        return {'ok': false, 'mensaje': decodeResp['user_message']};
      }
    } catch (e) {
      return {'ok': false, 'mensaje': 'Estamos teniendo algunos problemas'};
    }
  }

  Future<Map<String, dynamic>> login(
      String email, String password, String type) async {
    Map<String, String> _body = {
      "type": "Empleado",
      "email": email,
      "password": password,
    };

    final Response resp =
        await _dioPost.post(endPoint + loginFastWork, data: _body);
    try {
      Map<String, dynamic> decodeResp = resp.data;
      if (decodeResp['message'] == "OK") {
        _preferenciasUsuario.email = decodeResp['data']['data']['email'];
        _preferenciasUsuario.name = decodeResp['data']['data']['name'];
        _preferenciasUsuario.profilePhoto =
            decodeResp['data']['data']['profile_photo'];
        _preferenciasUsuario.id = decodeResp['data']['id'];
        _preferenciasUsuario.description =
            decodeResp['data']['data']['description'];
        return {'ok': true, 'mensaje': decodeResp['user_message']};
      } else {
        return {'ok': false, 'mensaje': decodeResp['user_message']};
      }
    } catch (e) {
      return {'ok': false, 'mensaje': 'Estamos teniendo algunos problemas'};
    }
  }

  Future<Map<String, dynamic>> acceptWork(String workId) async {
    Map<String, String> _body = {
      "work_id": workId,
      "user_id": _preferenciasUsuario.id,
      "profile_photo": _preferenciasUsuario.profilePhoto,
      "name": _preferenciasUsuario.name,
    };

    final Response resp =
        await _dioPost.post(endPoint + acceptFastWork, data: _body);
    try {
      Map<String, dynamic> decodeResp = resp.data;
      if (decodeResp['message'] == "OK") {
        return {'ok': true, 'mensaje': decodeResp['user_message']};
      } else {
        return {'ok': false, 'mensaje': decodeResp['user_message']};
      }
    } catch (e) {
      return {'ok': false, 'mensaje': 'Estamos teniendo algunos problemas'};
    }
  }
}
