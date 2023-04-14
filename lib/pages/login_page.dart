import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk form input username dan password
  final TextEditingController _usernameC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();

  // Variabel untuk menentukan apakah password sedang ditampilkan atau tidak
  bool _obscureText = true;

  // Fungsi untuk memperlihatkan atau menyembunyikan password
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Fungsi untuk memeriksa apakah username dan password valid
  bool _isLoginValid() {
    // value variabel username dan password
    String validUsername = "tes";
    String validPassword = "123456";
    return _usernameC.text == validUsername && _passwordC.text == validPassword;
  }

  // Fungsi untuk menavigasi ke halaman HomePage() setelah login berhasil
  void _navigateToMainMenu() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My UTDI",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        // widget listview agar halaman bisa di-scroll
        body: ListView(
          children: [
            // widget kolom untuk membungkus gambar dan input text email dan password
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  // widget gambar
                  child: SizedBox(
                    height: 300,
                    child: Lottie.asset("assets/lotties/login2.json"),
                  ),
                ),
                // widget container untuk membungkus widget text "Login"
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontFamily: 'ConcertOne', fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  // widget textfield untuk memasukkan input email
                  child: TextField(
                    controller: _usernameC,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsetsDirectional.symmetric(horizontal: 10),
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                      labelText: "Email",
                      hintText: "Email ID",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  // widget textfield untuk memasukkan input password
                  child: TextField(
                    // controller input form email dan password
                    controller: _passwordC,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _toggleObscureText,
                      ),
                    ),
                  ),
                ),
                // widget text untuk 'forgot password'
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                // ketika user valid akan dinavigasikan ke halaman berikutnya
                onPressed: () {
                  if (_isLoginValid()) {
                    _navigateToMainMenu();
                  } else {
                    // widget pop up ketika user salah memasukkan username atau password
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Login Failed'),
                        content: const Text('Invalid username or password'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Login",
                    style: TextStyle(fontFamily: 'ConcertOne', fontSize: 15)),
              ),
            ),
            // widget row untuk text 'new user' dan 'register'
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New User? ",
                ),
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
