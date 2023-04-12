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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    // Implementasi validasi
    String validUsername = "a";
    String validPassword = "a";
    return _usernameController.text == validUsername &&
        _passwordController.text == validPassword;
  }

  // Fungsi untuk menavigasi ke halaman menu utama setelah login berhasil
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
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 300,
                    // width: 300,
                    child: Lottie.asset("assets/lotties/login2.json"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontFamily: 'ConcertOne', fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _usernameController,
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
                  child: TextField(
                    controller: _passwordController,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue[900],
                          // fontSize: 20,
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
                onPressed: () {
                  if (_isLoginValid()) {
                    _navigateToMainMenu();
                  } else {
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
