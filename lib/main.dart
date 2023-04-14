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
      title: "My UTDI",
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: LoginPage()),
    );
  }
}
