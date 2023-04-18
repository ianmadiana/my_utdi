import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/box_item.dart';
import '../widgets/kartu_mhs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  // List data item berbentuk Map
  List<Map<String, dynamic>> items = [
    {
      'title': 'Informasi Matakuliah Ditawarkan',
      'img': 'assets/lotties/learning.json',
      'desc':
          'Informasi Matakuliah Ditawarkan berisi seluruh matakuliah yang ditawarkan pada semester aktif. Dari seluruh matakuliah yang terdapat pada daftar, setiap matakuliah mempunyai aturan tersendiri bergantung pada program studi, kurikulum, dan aturan akademik lainnya. Untuk lebih jelasnya, anda dapat melihat detil kelas.'
    },
    {
      'title': 'Presensi',
      'img': 'assets/lotties/checklist.json',
      'desc':
          'Rekap Presensi merupakan fasilitas yang dapat digunakan untuk melihat hasil rekap presensi mahasiswa persemester. Selain dapat dilihat secara online, rekap presensi ini juga dapat dicetak.'
    },
    {
      'title': 'Kartu Rencana Studi',
      'img': 'assets/lotties/list.json',
      'desc':
          'Kartu Rencana Studi merupakan fasilitas pengisian KRS secara online. Fasilitas KRS Online ini hanya dapat digunakan pada saat masa KRS atau masa revisi KRS. Mahasiswa dapat memilih matakuliah yang ingin diambil bersesuaian dengan jatah sks yang dimiliki dan matakuliah yang ditawarkan. Setelah melakukan pengisian KRS mahasiswa dapat mencetak KRS tersebut agar dapat ditandatangani oleh dosen pembimbingnya masing-masing.'
    },
    {
      'title': 'Transkrip Nilai',
      'img': 'assets/lotties/graph.json',
      'desc':
          'Transkrip Nilai berisi informasi nilai hasil studi mahasiswa mulai dari semester awal sampai dengan semester terakhir mahasiswa. Transkrip ini dapat dicetak dalam bentuk transkrip satu halaman.'
    },
    {
      'title': 'Info Aplikasi',
      'img': 'assets/lotties/info.json',
      'desc': 'Ini adalah super app kampus untuk mahasiswa'
    },
    {
      'title': 'Profil',
      'img': 'assets/lotties/profile.json',
      'desc':
          'Profil Mahasiswa berisi data pribadi pengguna portal akademik. Apabila terdapat kesalahan data, anda dapat menghubungi bagian akademik untuk memperbaikinya.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku Saku UTDI'),
      ),
      // Listview agar halaman bisa di-scroll jika terdapat item baru
      body: ListView(
        children: [
          // widget kartu mahasiswa diisi data menggunakan constructor
          KartuMhs(
              name: 'Ian XXXX',
              nim: 20549999,
              prodi: 'Informatika',
              status: 'Aktif'),
          // widget gridview untuk membuat daftar list kotak berbentuk grid lebih dari 1
          // menggunakan builder agar list dibuat otomatis sesuai jumlah data
          GridView.builder(
            // item di dalam gridview agar tidak di-scroll pada widget listview
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // jumlah grid sesuai jumlah item yang ada pada list data
            itemCount: items.length,
            // jumlah grid setiap baris ditentukan secara fixed
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // perbandingan rasio antar grid
              childAspectRatio: 1 / 1.2,
              // grid berjumlah 2 setiap baris
              crossAxisCount: 2,
            ),
            // gridview membutuhkan item builder/item apa yang akan di-build
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                // widget untuk berpindah halaman ke DetailPage ketika gridview ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      item: items[index],
                      desc: items[index]['desc'],
                      imageDetail: items[index]['img'],
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                // widget box item untuk menampilkan nama dan gambar menu pilihan
                child: BoxItem(
                  titleBox: items[index]['title'],
                  img: items[index]['img'],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class DetailPage berfungsi untuk menampilkan detail menu
class DetailPage extends StatelessWidget {
  DetailPage(
      {Key? key,
      required this.item,
      required this.desc,
      required this.imageDetail})
      : super(key: key);

  String? desc;
  String? imageDetail;

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: 250,
              // image menggunakan library Lottie
              child: Lottie.asset(item['img']),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                item['desc'],
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
