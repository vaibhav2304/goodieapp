import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'driverinterface.dart'; // Import the DriverInterfacePage

class DriverLoginPage extends StatefulWidget {
  @override
  _DriverLoginPageState createState() => _DriverLoginPageState();
}

class _DriverLoginPageState extends State<DriverLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    try {
      // Sign in with email and password using Firebase Auth
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );

      // After successful login, navigate to the DriverInterfacePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DriverInterfacePage()),
      );
    } catch (e) {
      // Handle login errors (e.g., wrong credentials, user not found, etc.)
      print('Error: $e');
      // You can show an error message to the user if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Login'),
        backgroundColor: Colors.black, // Charcoal black app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _usernameController,
              style: TextStyle(color: Colors.white), // White text color
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle:
                    TextStyle(color: Colors.grey), // Grey label text color
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey), // Grey underline color
                ),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white), // White text color
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle:
                    TextStyle(color: Colors.grey), // Grey label text color
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey), // Grey underline color
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFDD513A), // Gradient colors for Dealer button
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
