import 'dart:convert';
import 'package:toko_umb/helpers/api.dart';
import 'package:toko_umb/helpers/api_url.dart';
import 'package:toko_umb/model/registrasi_model.dart';

class RegistrasiBloc {
  static Future<RegistrasiModel> registrasi(
      {String? nama, String? email, String? password}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = {"nama": nama, "email": email, "password": password};

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return RegistrasiModel.fromJson(jsonObj);
  }
}
