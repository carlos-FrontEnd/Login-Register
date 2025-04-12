import 'package:flutter/material.dart';
import 'package:home/account/authProvider.dart';
import 'package:provider/provider.dart';
import 'login_form.dart';
import 'register_form.dart';
import '../logo_title.dart';

class Autentikasi extends StatefulWidget {
  const Autentikasi({super.key});

  @override
  State<Autentikasi> createState() => _Autentikasi();
}

class _Autentikasi extends State<Autentikasi> {
  bool modeMasuk = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _gantiModeAutentikasi() {
    setState(() {
      modeMasuk = !modeMasuk;
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
    });
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final scaffold = ScaffoldMessenger.of(context);

    try {
      if (modeMasuk) {
        await auth.login(_emailController.text, _passwordController.text);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        await auth.register(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
        );
        scaffold.showSnackBar(
          SnackBar(
            content: Text(
              modeMasuk ? 'Login berhasil!' : 'Registrasi berhasil!',
            ),
          ),
        );
      }
      // Navigasi ke halaman beranda setelah login/register sukses
    } catch (e) {
      scaffold.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
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
                modeMasuk
                    ? LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                    )
                    : RegisterForm(
                      nameController: _nameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                    ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _submitForm(context),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(modeMasuk ? 'MASUK' : 'DAFTAR'),
                ),
                TextButton(
                  onPressed: _gantiModeAutentikasi,
                  child: Text(
                    modeMasuk
                        ? 'Belum punya akun? Daftar'
                        : 'Sudah punya akun? Masuk',
                    style: const TextStyle(color: Colors.deepPurple),
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
