import 'package:flutter/material.dart';
import 'driverlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class DriverPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _truckNumberController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _truckCapacityController =
      TextEditingController();
  final TextEditingController _transporterNameController =
      TextEditingController();
  final TextEditingController _drivingExperienceController =
      TextEditingController();
  final TextEditingController _interestedRoute1Controller =
      TextEditingController();
  final TextEditingController _interestedRoute2Controller =
      TextEditingController();
  final TextEditingController _interestedRoute3Controller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Signup'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextFormField(
              controller: _truckNumberController,
              decoration: InputDecoration(labelText: 'Truck Number'),
            ),
            TextFormField(
              controller: _mobileNumberController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
            ),
            TextFormField(
              controller: _truckCapacityController,
              decoration: InputDecoration(labelText: 'Truck Capacity'),
            ),
            TextFormField(
              controller: _transporterNameController,
              decoration: InputDecoration(labelText: 'Transporter Name'),
            ),
            TextFormField(
              controller: _drivingExperienceController,
              decoration: InputDecoration(labelText: 'Driving Experience'),
            ),
            TextFormField(
              controller: _interestedRoute1Controller,
              decoration: InputDecoration(labelText: 'Interested Route 1'),
            ),
            TextFormField(
              controller: _interestedRoute2Controller,
              decoration: InputDecoration(labelText: 'Interested Route 2'),
            ),
            TextFormField(
              controller: _interestedRoute3Controller,
              decoration: InputDecoration(labelText: 'Interested Route 3'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                // Get the entered username and password from the TextFormField widgets
                String username = _usernameController.text.trim();
                String password = _passwordController.text.trim();

                try {
                  // Use Firebase authentication to sign in with email and password
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: username,
                    password: password,
                  );

                  // If the login is successful, navigate to the DealerInterfacePage
                  if (userCredential.user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => dealerinterface()),
                    );
                  } else {
                    // Handle unsuccessful login (e.g., show an error message)
                    // For example, you can use a SnackBar to display the error:
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Invalid credentials. Please try again.'),
                    ));
                  }
                } catch (e) {
                  print('Error occurred during login: $e');
                  // Handle any errors that occurred during login (e.g., show an error message)
                  // For example, you can use a SnackBar to display the error:
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('An error occurred. Please try again later.'),
                  ));
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF30477E),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Signup'),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriverLoginPage()),
                );
              },
              child: Text(
                'Already a user? Login',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dealerinterface() {}
}
