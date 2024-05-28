import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: const Center(
        child: Text('My Cart Page'),
      ),
    
    );
  }
}
 