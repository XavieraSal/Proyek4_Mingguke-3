import 'package:flutter/material.dart';
import 'material_theme.dart'; // Import material_theme.dart untuk menggunakan MaterialTheme dan MaterialScheme

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isPasswordVisible = false; // Status visibilitas password

  @override
  Widget build(BuildContext context) {
    final MaterialTheme theme = MaterialTheme(const TextTheme()); // Gunakan MaterialTheme dari material_theme.dart
    final ThemeData themeData = theme.light(); // Gunakan light theme dari MaterialTheme

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 80.0),
              Column(
                children: <Widget>[
                  Image.asset('assets/diamond.png'),
                  const SizedBox(height: 16.0),
                  Text(
                    'SHRINE',
                    style: themeData.textTheme.headline6, // Gunakan headline6 dari TextTheme
                  ),
                ],
              ),
              const SizedBox(height: 120.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Username',
                  fillColor: themeData.colorScheme.surface, // Sesuaikan warna background dengan surface color dari MaterialScheme
                ),
              ),
              const SizedBox(height: 12.0),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Password',
                      fillColor: themeData.colorScheme.surface, // Sesuaikan warna background dengan surface color dari MaterialScheme
                    ),
                    obscureText: !_isPasswordVisible, // Tampilkan atau sembunyikan password sesuai status visibilitas
                  ),
                  IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off, // Icon mata terbuka atau tersembunyi
                      color: themeData.colorScheme.primary, // Warna ikon
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible; // Ubah status visibilitas password
                      });
                    },
                  ),
                ],
              ),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: themeData.colorScheme.secondary,
                      backgroundColor: themeData.colorScheme.surface, // Sesuaikan warna background dengan surface color dari MaterialScheme
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('NEXT'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0,
                      primary: themeData.colorScheme.inversePrimary, // Sesuaikan warna background dengan primary color dari MaterialScheme
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      textStyle: TextStyle(color: Colors.white), // Atur warna teks menjadi putih
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
