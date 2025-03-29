import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe List',
      theme: ThemeData(
        fontFamily: 'Arial',
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: SwipeListScreen(),
    );
  }
}

class SwipeListScreen extends StatefulWidget {
  @override
  _SwipeListScreenState createState() => _SwipeListScreenState();
}

class _SwipeListScreenState extends State<SwipeListScreen> {
  List<String> items = List.generate(10, (index) => "Item ${index + 1}");
  List<Color> colors = [
    Colors.purpleAccent,
    Colors.blueAccent,
    Colors.teal,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.green,
    Colors.pinkAccent,
    Colors.amber,
    Colors.indigoAccent,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe List', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        elevation: 5,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(items[index]),
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.delete, color: Colors.white, size: 30),
              ),
              secondaryBackground: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.edit, color: Colors.white, size: 30),
              ),
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  setState(() {
                    items.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Deleted")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Edit option tapped")));
                }
              },
              child: Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: colors[index % colors.length],
                child: ListTile(
                  title: Text(
                    items[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  tileColor: Colors.transparent,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}