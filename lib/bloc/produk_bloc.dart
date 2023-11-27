import 'dart:convert';
import 'package:toko_umb/helpers/api.dart';
import 'package:toko_umb/helpers/api_url.dart';
import 'package:toko_umb/model/produk_model.dart';

class ProdukBloc {
  static Future<List<ProdukModel>> getProduks() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listProduk = (jsonObj as Map<String, dynamic>)['data'];
    List<ProdukModel> produks = [];
    for (int i = 0; i < listProduk.length; i++) {
      produks.add(ProdukModel.fromJson(listProduk[i]));
    }
    return produks;
  }

  static Future addProduk({ProdukModel? produk}) async {
    String apiUrl = ApiUrl.createProduk;

    var body = {            
      "kodeproduk": produk!.kodeproduk,
      "namaproduk": produk.namaproduk,
      "hargaproduk": produk.hargaproduk.toString()
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateProduk({required ProdukModel produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk.id!);

    var body = {
      "kodeproduk": produk.kodeproduk,
      "namaproduk": produk.namaproduk,
      "hargaproduk": produk.hargaproduk.toString()
    };
    // ignore: avoid_print
    print("Body : $body");
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['data'];
  }

  static Future<bool> deleteProduk({int? id}) async {
    String apiUrl = ApiUrl.deleteProduk(id!);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}
