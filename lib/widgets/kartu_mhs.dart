import 'package:flutter/material.dart';

import 'item_ktm.dart';

// class layout untuk kartu mahasiswa
class KartuMhs extends StatelessWidget {
  KartuMhs(
      {super.key,
      required this.name,
      required this.nim,
      required this.prodi,
      required this.status});

  late String name;
  late int nim;
  late String prodi;
  late String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ItemKtm(name: name, nim: nim, prodi: prodi, status: status),
        ),
      ),
    );
  }
}

