import 'package:flutter/material.dart';
import 'package:toko_umb/model/produk_model.dart';
import 'package:toko_umb/ui/produk_detail_view.dart';
import 'package:toko_umb/ui/produk_view.dart';


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
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout),
                onTap: () async {},
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            ItemProduk(
                produk: ProdukModel(
                    id: 1,
                    kodeproduk: 'A001',
                    namaproduk: 'Kamera',
                    hargaproduk: 5000000)),
            ItemProduk(
                produk: ProdukModel(
                    id: 2,
                    kodeproduk: 'A002',
                    namaproduk: 'Kulkas',
                    hargaproduk: 2500000)),
            ItemProduk(
                produk: ProdukModel(
                    id: 3,
                    kodeproduk: 'A003',
                    namaproduk: 'Mesin Cuci',
                    hargaproduk: 2000000)),
          ],
        ));
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
          subtitle: Text(produk.hargaproduk.toString()),
        ),
      ),
    );
  }
}
