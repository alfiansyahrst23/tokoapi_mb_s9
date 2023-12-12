import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toko_umb/bloc/produk_bloc.dart';
import 'package:toko_umb/model/produk_model.dart';
import 'package:toko_umb/ui/produk_view.dart';
import 'package:toko_umb/ui/produk_view_list.dart';
import 'package:toko_umb/widget/warning_dialog.dart';

// ignore: must_be_immutable
// ignore: must_be_immutable
class ProdukDetailView extends StatefulWidget {
  ProdukModel? produk;

  ProdukDetailView({Key? key, this.produk}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProdukDetailViewState createState() => _ProdukDetailViewState();
}

class _ProdukDetailViewState extends State<ProdukDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                'https://miro.medium.com/v2/resize:fit:640/format:webp/0*ObJbOfJnx4QIPUq9.png'),
            Text(
              "Kode : ${widget.produk!.kodeproduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk!.namaproduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk!.hargaproduk.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Tombol Edit
        OutlinedButton(
            child: const Text("EDIT"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProdukView(
                            produk: widget.produk!,
                          )));
            }),
        //Tombol Hapus
        OutlinedButton(
            child: const Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }

//   void confirmHapus() {
//     AlertDialog alertDialog = AlertDialog(
//       content: const Text("Yakin ingin menghapus data ini?"),
//       actions: [
//         //tombol hapus
//         OutlinedButton(
//           child: const Text("Ya"),
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ProdukView(
//                           produk: widget.produk!,
//                         )));
//           },
//         ),
//         //tombol batal
//         OutlinedButton(
//           child: const Text("Batal"),
//           onPressed: () => Navigator.pop(context),
//         )
//       ],
//     );

//     showDialog(builder: (context) => alertDialog, context: context);
//   }
// }

void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        //tombol hapus
        OutlinedButton(
            child: const Text("Ya"),
            onPressed: () {
              //var validate = _formKey.currentState!.validate();
             // if (validate) {
                //if (!_isLoading) {
                  if (widget.produk != null) {
                    //kondisi update produk
                    delete();
                  } else {
                    //kondisi tambah produk
                    //simpan();
                  }
                //}
              //}
            }),
        //tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

delete() {
    setState(() {
      //_isLoading = true;
    });
    //ProdukModel updateProduk = ProdukModel(id: null);
    //updateProduk.id = widget.produk!.id;
    //updateProduk.kodeproduk = widget.produk!.kodeproduk;
    //updateProduk.namaproduk = widget.produk!.namaproduk;
    //updateProduk.hargaproduk = widget.produk!.hargaproduk;
    ProdukBloc.deleteProduk(widget.produk!.id).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukViewList()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Proses delete data gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      //_isLoading = false;
    });
  }
}
