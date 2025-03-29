import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Date & Time Picker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Date & Time Picker',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 8,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInfoCard(
                  title: "Selected Date",
                  value: _selectedDate == null
                      ? "No Date Selected"
                      : "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}",
                  icon: Icons.calendar_today,
                  color: Colors.amber,
                ),
                SizedBox(height: 20),
                _buildButton("Pick a Date", Icons.date_range, _pickDate),
                SizedBox(height: 40),
                _buildInfoCard(
                  title: "Selected Time",
                  value: _selectedTime == null
                      ? "No Time Selected"
                      : _selectedTime!.format(context),
                  icon: Icons.access_time,
                  color: Colors.cyan,
                ),
                SizedBox(height: 20),
                _buildButton("Pick a Time", Icons.timer, _pickTime),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 24),
      label: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildInfoCard({required String title, required String value, required IconData icon, required Color color}) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: color,
      child: ListTile(
        leading: Icon(icon, color: Colors.white, size: 28),
        title: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        subtitle: Text(
          value,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
        ),
      ),
    );
  }
}
