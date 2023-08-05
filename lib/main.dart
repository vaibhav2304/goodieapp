import 'package:flutter/material.dart';
import 'dealer.dart';
import 'driver.dart'; // Import the DealerPage

void main() {
  runApp(GoodieApp());
}

class GoodieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/driver': (context) => DriverPage(),
        '/dealer': (context) => DealerPage(), // Define the route for DealerPage
        // Add other routes for different pages here if needed
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'icons/goodie.png',
              width: 150,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/driver');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF30477E),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Driver'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/dealer'); // Navigate to DealerPage
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFDD513A),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Dealer'),
            ),
          ],
        ),
      ),
    );
  }
}
