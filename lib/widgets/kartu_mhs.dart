import 'package:flutter/material.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(20),
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
          ),
        ),
      ),
    );
  }
}
