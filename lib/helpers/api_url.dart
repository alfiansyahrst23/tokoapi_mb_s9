class ApiUrl {
  //static const String baseUrl = 'http://192.168.0.115/apitoko/public';
  static const String baseUrl = 'http://172.25.0.191/tokoapi/public';
  //static const String baseUrl = 'http://localhost/apitoko/public';
  static const String registrasi = '$baseUrl/registrasi';
  static const String login = '$baseUrl/login';
  static const String listProduk = '$baseUrl/produk';
  static const String createProduk = '$baseUrl/produk';

  // static String updateProduk(int id) {
  //   return '$baseUrl/produk/$id/update';
  // }

static String updateProduk(int id) {
    return '$baseUrl/produk/$id';
  }

  static String showProduk(int id) {
    return '$baseUrl/produk/$id';
  }

  static String deleteProduk(int id) {
    return '$baseUrl/produk/$id';
  }
}
