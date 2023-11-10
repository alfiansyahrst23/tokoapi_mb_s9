class ProdukModel {
  int? id;
  String? kodeproduk;
  String? namaproduk;
  int? hargaproduk;

  ProdukModel({this.id, this.kodeproduk, this.namaproduk, this.hargaproduk});

  factory ProdukModel.fromJson(Map<String, dynamic> obj) {
    return ProdukModel(
        id: obj['id'],
        kodeproduk: obj['kodeproduk'],
        namaproduk: obj['namaproduk'],
        hargaproduk: obj['hargaproduk']);
  }
}
