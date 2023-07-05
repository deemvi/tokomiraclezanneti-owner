import 'package:flutter/material.dart';
import '../service/pesanan_service.dart';
import '../model/pesanan.dart';

class PesananDetail extends StatefulWidget {
  final Pesanan pesanan;
  const PesananDetail({Key? key, required this.pesanan}) : super(key: key);
  _PesananDetailState createState() => _PesananDetailState();
}

class _PesananDetailState extends State<PesananDetail> {
  Stream<Pesanan> getData() async* {
    Pesanan data = await PesananService().getById(widget.pesanan.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pesanan")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Tidak Ditemukan');
          }
          return Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Nama Pemesan : ${snapshot.data.namaPemesan}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Alamat : ${snapshot.data.alamat}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "No. Telepon : ${snapshot.data.noTelp}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Nama Barang : ${snapshot.data.namaBarang}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Harga : ${snapshot.data.harga}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Jumlah Pesanan : ${snapshot.data.jumlahPesanan}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Status : ${snapshot.data.status}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )
            ],
          );
        },
      ),
    );
  }
}
