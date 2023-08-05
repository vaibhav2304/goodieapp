import 'package:flutter/material.dart';

class DriverInterfacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Interface'),
        backgroundColor: Colors.black, // Charcoal black app bar
      ),
      body: Center(
        child: Text(
          'Welcome to the Driver Interface!',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
