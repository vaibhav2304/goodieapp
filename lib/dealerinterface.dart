import 'package:flutter/material.dart';

class DealerInterfacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dealer Interface'),
        backgroundColor: Colors.black, // Charcoal black app bar
      ),
      body: Center(
        child: Text(
          'Welcome to the Dealer Interface!',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
