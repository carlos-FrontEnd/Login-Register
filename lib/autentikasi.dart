import 'package:flutter/material.dart';
import 'package:home/login_form.dart';

import 'register_form.dart';
import 'logo_title.dart';

class Autentikasi extends StatefulWidget {
  const Autentikasi({super.key});

  @override
  State<Autentikasi> createState() => _Autentikasi();
}

class _Autentikasi extends State<Autentikasi> {
  bool modeMasuk = true;

  void _gantiModeAutentikasi() {
    setState(() {
      modeMasuk = !modeMasuk;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoTitle(),
              Text(
                modeMasuk ? 'Selamat Datang!' : 'Buat Akun Baru',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
                color: Colors.deepPurple,
                indent: 50,
                endIndent: 50,
              ),
              const SizedBox(height: 20),
              modeMasuk ? const LoginForm() : const RegisterForm(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text(modeMasuk ? 'MASUK' : 'DAFTAR'),
              ),
              TextButton(
                onPressed: _gantiModeAutentikasi,
                child: Text(
                  modeMasuk ? 'Belum punya akun? Daftar' : 'Sudah punya akun? Masuk',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}