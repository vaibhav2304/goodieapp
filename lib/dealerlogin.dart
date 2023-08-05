import 'package:flutter/material.dart';
import 'dealerinterface.dart'; // Import the DealerInterfacePage
import 'package:firebase_auth/firebase_auth.dart';

class DealerLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dealer Login'),
        backgroundColor: Colors.black, // Charcoal black app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
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
              onPressed: () {
                // Handle login button press
                // Perform login logic here

                // Assuming successful login, navigate to the DealerInterfacePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DealerInterfacePage()),
                );
              },
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
