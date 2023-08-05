import 'package:flutter/material.dart';
import 'dealerlogin.dart'; // Importing the dealer login page
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class DealerPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _natureOfMaterialController =
      TextEditingController();
  final TextEditingController _weightOfMaterialController =
      TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dealer Signup'),
        backgroundColor: Colors.black, // Charcoal black app bar
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
              controller: _mobileNumberController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
            ),
            TextFormField(
              controller: _natureOfMaterialController,
              decoration: InputDecoration(labelText: 'Nature of Material'),
            ),
            TextFormField(
              controller: _weightOfMaterialController,
              decoration: InputDecoration(labelText: 'Weight of Material'),
            ),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextFormField(
              controller: _stateController,
              decoration: InputDecoration(labelText: 'State'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                // Handle Dealer signup button press
                // Perform dealer signup logic here

                // Assuming successful signup, store the data into Firebase
                try {
                  final dealerSnapshot = await FirebaseFirestore.instance
                      .collection('dealers')
                      .where('username', isEqualTo: _usernameController.text)
                      .get();

                  if (dealerSnapshot.docs.isEmpty) {
                    // No dealer with the same username found, proceed to add the new dealer's data
                    await FirebaseFirestore.instance.collection('dealers').add({
                      'name': _nameController.text,
                      'username': _usernameController.text,
                      'password': _passwordController.text,
                      'mobileNumber': _mobileNumberController.text,
                      'natureOfMaterial': _natureOfMaterialController.text,
                      'weightOfMaterial': _weightOfMaterialController.text,
                      'quantity': _quantityController.text,
                      'city': _cityController.text,
                      'state': _stateController.text,
                    });

                    // After storing the data, navigate to the login page (DealerLoginPage)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DealerLoginPage()),
                    );
                  } else {
                    // Dealer with the same username already exists
                    // You can show an error message or handle this case as needed
                    print('Dealer with the same username already exists.');
                  }
                } catch (e) {
                  // Handle any errors that occurred during data storage
                  print('Error: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFDD513A), // Gradient colors for Dealer button
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
                  MaterialPageRoute(builder: (context) => DealerLoginPage()),
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
}
