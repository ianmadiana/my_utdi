import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/box_item.dart';
import '../widgets/kartu_mhs.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  List<Map<String, dynamic>> items = [
    {
      'title': 'Matakuliah Ditawarkan',
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku Saku UTDI'),
      ),
      body: ListView(
        children: [
          KartuMhs(
              name: 'Ian Madiana',
              nim: 205410002,
              prodi: 'Informatika',
              status: 'Aktif'),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
