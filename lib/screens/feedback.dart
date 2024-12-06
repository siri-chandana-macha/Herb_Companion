import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Your Experience',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _feedback = '';
  double _rating = 3.0;
  final _emailController = TextEditingController();
  bool _isValidEmail = false;
  
  // Focus nodes for each field
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _feedbackFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameFocus.addListener(() => setState(() {}));
    _emailFocus.addListener(() => setState(() {}));
    _feedbackFocus.addListener(() => setState(() {}));
    _emailController.addListener(_validateEmailOnChange);
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _feedbackFocus.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmailOnChange() {
    setState(() {
      _isValidEmail = _isEmailValid(_emailController.text);
    });
  }

  bool _isEmailValid(String email) {
    if (email.isEmpty) return false;
    
    // Complex email validation pattern
    final emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(emailPattern);
    
    if (!regex.hasMatch(email)) return false;
    
    // Additional validation rules
    if (email.startsWith('.') || email.endsWith('.')) return false;
    if (email.contains('..')) return false;
    if (email.split('@').length != 2) return false;
    
    return true;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!_isEmailValid(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final formWidth = screenWidth * 0.4;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
          '🌿 Share Your Experience With Us 🌿',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 158, 219, 160),
       
      ),
      body: Container(
        height: screenHeight - AppBar().preferredSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.green[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: formWidth,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      focusNode: _nameFocus,
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: _nameFocus.hasFocus ? Colors.green[700] : Colors.grey,
                        ),
                        suffixText: _nameFocus.hasFocus ? '🌱' : '',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      onSaved: (value) => _name = value!,
                      validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      focusNode: _emailFocus,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Your Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: _emailFocus.hasFocus ? Colors.green[700] : Colors.grey,
                        ),
                        suffixIcon: _emailController.text.isNotEmpty
                          ? Icon(
                              _isValidEmail ? Icons.check_circle : Icons.error,
                              color: _isValidEmail ? Colors.green : Colors.red,
                            )
                          : null,
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        helperText: _emailFocus.hasFocus 
                          ? 'Enter a valid email address (e.g., user@example.com)'
                          : null,
                        helperStyle: TextStyle(color: Colors.grey[600]),
                        errorStyle: TextStyle(
                          color: Colors.red[700],
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                      onSaved: (value) => _email = value!,
                      validator: _validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      focusNode: _feedbackFocus,
                      decoration: InputDecoration(
                        labelText: 'Your Feedback',
                        prefixIcon: Icon(
                          Icons.comment,
                          color: _feedbackFocus.hasFocus ? Colors.green[700] : Colors.grey,
                        ),
                        suffixText: _feedbackFocus.hasFocus ? '💬' : '',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      maxLines: 3,
                      onSaved: (value) => _feedback = value!,
                      validator: (value) => value!.isEmpty ? 'Please provide feedback' : null,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text('🌿 How would you rate Herb Companion?',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Slider(
                      value: _rating,
                      min: 1.0,
                      max: 5.0,
                      divisions: 4,
                      label: _rating.toStringAsFixed(1),
                      activeColor: Colors.green[600],
                      onChanged: (value) => setState(() => _rating = value),
                    ),
                    Container(
                      height: screenHeight * 0.12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _buildRatingIcon(Icons.sentiment_very_satisfied, 5.0, Colors.deepPurple, "Loved it!", 40),
                          _buildRatingIcon(Icons.sentiment_satisfied, 4.0, Colors.blueAccent, "Good", 40),
                          _buildRatingIcon(Icons.sentiment_neutral, 3.0, const Color.fromARGB(255, 241, 65, 233), "Okay", 40),
                          _buildRatingIcon(Icons.sentiment_dissatisfied, 2.0, Colors.orangeAccent, "Fair", 40),
                          _buildRatingIcon(Icons.sentiment_very_dissatisfied, 1.0, Colors.red, "Poor", 40),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: SizedBox(
                        width: formWidth * 0.7,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[800],
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Feedback Submitted 🌿'),
                                    content: Text('Thank you for sharing your thoughts!'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(),
                                        child: Text('Okay'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Text('Submit Feedback',
                              style: TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRatingIcon(IconData icon, double value, Color color, String label, double size) {
    return GestureDetector(
      onTap: () => setState(() => _rating = value),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, color: _rating == value ? color : Colors.grey[400], size: size),
          SizedBox(height: 4),
          Text(label,
              style: TextStyle(
                fontSize: 12,
                color: _rating == value ? color : Colors.grey[600],
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}