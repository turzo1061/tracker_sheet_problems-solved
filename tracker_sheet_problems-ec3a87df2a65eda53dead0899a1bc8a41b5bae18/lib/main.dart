import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[50],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/profile.jpg',
                      ), // Replace with your image
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'User',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
              _drawerItem(context, 'Home', HomeScreen()),
              _drawerItem(context, 'Screen 1', Screen1()),
              _drawerItem(context, 'Screen 2', Screen2()),
              _drawerItem(context, 'Screen 3', Screen3()),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Home Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListTile _drawerItem(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.deepPurple, fontSize: 18),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildScreen(context, 'Screen 1');
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildScreen(context, 'Screen 2');
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildScreen(context, 'Screen 3');
  }
}

Widget _buildScreen(BuildContext context, String screenTitle) {
  return Scaffold(
    appBar: AppBar(
      title: Text(screenTitle),
      centerTitle: true,
      backgroundColor: Colors.purpleAccent,
      elevation: 10,
    ),
    drawer: Drawer(
      child: Container(
        color: Colors.deepPurple[50],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/profile.jpg',
                    ), // Replace with your image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'User',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            _drawerItem(context, 'Home', HomeScreen()),
            _drawerItem(context, 'Screen 1', Screen1()),
            _drawerItem(context, 'Screen 2', Screen2()),
            _drawerItem(context, 'Screen 3', Screen3()),
          ],
        ),
      ),
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '$screenTitle Content',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ),
      ),
    ),
  );
}

ListTile _drawerItem(BuildContext context, String title, Widget screen) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(color: Colors.deepPurple, fontSize: 18),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
  );
}
