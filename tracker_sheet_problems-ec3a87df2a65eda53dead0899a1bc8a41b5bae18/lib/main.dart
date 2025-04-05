import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First Application'),
          centerTitle: true, 
          backgroundColor: const Color.fromARGB(255, 59, 147, 255),
        ),
        body: const Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'DMSans',
              color: Color.fromARGB(255, 226, 182, 47),
            ),
          ),
        ),
      ),
    );
  }
}

