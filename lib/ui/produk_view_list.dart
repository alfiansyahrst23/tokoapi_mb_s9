import 'package:flutter/material.dart';
import 'package:toko_umb/bloc/login_bloc.dart';
import 'package:toko_umb/bloc/logout_bloc.dart';
import 'package:toko_umb/bloc/produk_bloc.dart';
import 'package:toko_umb/model/produk_model.dart';
import 'package:toko_umb/ui/login_view.dart';
import 'package:toko_umb/ui/produk_detail_view.dart';
import 'package:toko_umb/ui/produk_view.dart';

//produk_page.dart
class ProdukViewList extends StatefulWidget {
  const ProdukViewList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProdukViewListState createState() => _ProdukViewListState();
}

class _ProdukViewListState extends State<ProdukViewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: const Icon(Icons.add, size: 26.0),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProdukView()));
                },
              ))
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       ListTile(
      //         title: const Text('Logout'),
      //         trailing: const Icon(Icons.logout),
      //         onTap: () async {
      //           await LogoutBloc.logout().then((value) => {
      //                 Navigator.pushReplacement(context,
      //                     MaterialPageRoute(builder: (context) =>const LoginView()))
      //               });
      //         },
      //       )
      //     ],
      //   ),
      // ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("images/umb.png"),
                      fit: BoxFit.scaleDown)),
              child: Text(''),
            ),
            ListTile(
              leading: const Icon(
                Icons.add,
              ),
              title: const Text('Input Produk'),
              onTap: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProdukView()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () async {
                await LogoutBloc.logout().then((value) => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()))
                    });
              },
            )
          ],
        ),
      ),

      body: FutureBuilder<List>(
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          // ignore: avoid_print
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListProduk(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListProduk extends StatelessWidget {
  final List? list;

  const ListProduk({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemProduk(
            produk: list![i],
          );
        });
  }
}

class ItemProduk extends StatelessWidget {
  final ProdukModel produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetailView(
                      produk: produk,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaproduk!),
          leading: Image.network(
              'https://miro.medium.com/v2/resize:fit:640/format:webp/0*ObJbOfJnx4QIPUq9.png',
              height: 50,
              fit: BoxFit.fill),
          subtitle: Text(produk.hargaproduk.toString()),
        ),
      ),
    );
  }
}
