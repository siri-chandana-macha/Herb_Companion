import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herb Garden Companion',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _passwordError = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Validation logic for the password
  bool _isPasswordValid(String password) {
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= 6;

    if (!hasUppercase) {
      _passwordError = 'Password must contain at least one uppercase letter.';
    } else if (!hasSpecialChar) {
      _passwordError = 'Password must contain at least one special symbol.';
    } else if (!hasMinLength) {
      _passwordError = 'Password must be at least 6 characters long.';
    } else {
      _passwordError = '';
      return true;
    }
    return false;
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password.')),
      );
    } else if (_isPasswordValid(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful! Welcome, $username!')),
      );
    } else {
      setState(() {}); // Update the UI to show password error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFB9E0BB),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', height: 100),
                  SizedBox(height: 30),
                  Text(
                    'Welcome to Herb Garden Companion',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your companion for growing and using herbs!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green[700],
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person, color: Colors.green),
                        filled: true,
                        fillColor: Colors.green[100],
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock, color: Colors.green),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.green[100],
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        errorText: _passwordError.isNotEmpty ? _passwordError : null,
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (_passwordError.isNotEmpty)
                    Text(
                      _passwordError,
                      style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[600],
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      shadowColor: Colors.tealAccent,
                      elevation: 10,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}