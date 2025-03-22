import 'package:flutter/material.dart';

void main() {
  runApp(const TrackerSheet());
}

class TrackerSheet extends StatelessWidget {
  const TrackerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 184, 141),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Text Style',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 43, 80, 155),
              fontFamily: 'DMSans',
            ),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text(
                  'Hello World!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 43, 80, 155),
                    fontFamily: 'DMSans',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Turzo - BOLD',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Turzo - Italic',
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Turzo - Underlined',
                style: TextStyle(
                  fontSize: 22,
                  decoration: TextDecoration.underline,
                  color: Colors.green,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Turzo - Shadow',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 245, 244, 242),
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(3, 3),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Turzo Samanta - Spacing',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 6.0,
                  wordSpacing: 1.0,
                  color: const Color.fromARGB(255, 151, 147, 153),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'STUDENT ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 80, 149, 206),
                    ),
                  ),
                  Text(
                    'ID ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(255, 206, 128, 123),
                    ),
                  ),
                  Text(
                    'DEPARTMENT',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 117, 212, 121),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
