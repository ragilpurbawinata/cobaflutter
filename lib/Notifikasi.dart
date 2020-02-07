import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          scrollDirection: Axis.vertical,
          itemCount: 5, itemBuilder: (context, index) {
        return Container(
          //height: 200,
          width: double.infinity,
          child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text("Permintaan Cuti Anda telah disetujui", textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.lightBlue)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("22 Juni 1999", textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text("Pengajuan cuti anda dengan nomor LVE.2019.06.000475  telah disetujui oleh seluruh Supervisor/Admin.",
                          textAlign: TextAlign.start,),
                    ),
                  ]
              )
          ),
        );
      }),
    );
  }
}
