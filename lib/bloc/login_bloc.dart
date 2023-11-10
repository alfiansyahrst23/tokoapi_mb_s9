import 'dart:convert';
import 'package:toko_umb/helpers/api.dart';
import 'package:toko_umb/helpers/api_url.dart';
import 'package:toko_umb/model/login_model.dart';

class LoginBloc {
  static Future<LoginModel> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return LoginModel.fromJson(jsonObj);
  }
}
