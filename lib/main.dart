import 'package:flutter/material.dart';
import 'package:toko_umb/helpers/user_info.dart';
import 'package:toko_umb/ui/login_view.dart';
import 'package:toko_umb/ui/produk_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        //page = const ProdukView();
        page = ProdukView();
      });
    } else {
      setState(() {
        page = const LoginView();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko UMB',
      debugShowCheckedModeBanner: false,
      home: page,
      /* routes: {
        "/": (BuildContext context) => const LoginView(),
        "/login": (BuildContext context) => const LoginView(),
        "/register": (BuildContext context) =>const RegistrasiView(),        
        "/home": (BuildContext context) => ProdukView(),
      }, */
    );
  }
}
