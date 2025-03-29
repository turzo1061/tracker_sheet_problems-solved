import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interactive Animated Box',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      home: AnimatedContainerScreen(),
    );
  }
}

class AnimatedContainerScreen extends StatefulWidget {
  @override
  _AnimatedContainerScreenState createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double _width = 120;
  double _height = 120;
  Color _color = Colors.deepPurpleAccent;
  double _borderRadius = 20;

  void _changeContainer() {
    setState(() {
      final random = Random();

      _width = random.nextDouble() * 200 + 120; // Range: 120-320
      _height = random.nextDouble() * 200 + 120;
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = random.nextDouble() * 100; // Random border radius
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          'Interactive Animated Box',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOutCubic,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_color, Colors.white.withOpacity(0.4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _color.withOpacity(0.6),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: Offset(5, 10),
                  )
                ],
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _changeContainer,
              child: Text(
                'Transform',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.purpleAccent,
                foregroundColor: Colors.white,
                elevation: 10,
                shadowColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
