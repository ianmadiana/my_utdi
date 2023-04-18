import 'package:flutter/material.dart';
import 'package:my_utdi/pages/login_page.dart';

void main() {
  // pertama kali aplikasi akan menjalankan fungsi runApp()
  runApp(const MyApp());
}

// class MyApp akan dijalankan dan memanggil class LoginPage() pada parameter home
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // nama aplikasi
      title: "My UTDI",
      // menghilangkan tanda debug di aplikasi
      debugShowCheckedModeBanner: false,
      // widget SafeArea digunakan untuk menentukan area yang aman dan tidak terhalang oleh elemen lain di dalam aplikasi
      home: SafeArea(child: LoginPage()),
    );
  }
}
