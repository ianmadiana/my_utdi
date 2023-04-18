import 'package:flutter/material.dart';

// class kartu mahasiswa
class ItemKtm extends StatelessWidget {
  const ItemKtm({
    super.key,
    required this.name,
    required this.nim,
    required this.prodi,
    required this.status,
  });

  final String name;
  final int nim;
  final String prodi;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      // widget Row menampilkan widget secara horizontal.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/images/logo_utdi.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Nama Mahasiswa: "),
                Text(name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text("NIM: "),
                Text(nim.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text("Fakultas / Program Studi: : "),
                Text(prodi,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text("Status Kemahasiswaan:  "),
                Text(status,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
