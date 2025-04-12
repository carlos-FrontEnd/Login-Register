import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String email;
  final String password;

  User({required this.name, required this.email, required this.password});
}

class AuthProvider with ChangeNotifier {
  List<User> _users = [];
  User? _currentUser;

  // Getter
  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  // Sign Up
  Future<void> register(String name, String email, String password) async {
    if (_users.any((user) => user.email == email)) {
      throw Exception('Email sudah terdaftar');
    }

    final newUser = User(name: name, email: email, password: password);
    _users.add(newUser);
    _currentUser = newUser;
    notifyListeners();
  }

  // Sign In
  Future<void> login(String email, String password) async {
    try {
      final user = _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
      _currentUser = user;
      notifyListeners();
    } catch (e) {
      throw Exception('Email atau password salah');
    }
  }

  // Sign Out
  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
