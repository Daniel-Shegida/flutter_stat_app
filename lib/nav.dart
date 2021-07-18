import 'package:flutter/material.dart';
import 'sreens/getScreen.dart';
import 'sreens/table_screen.dart';
import 'sreens/value_screen.dart';
import 'sreens/chart_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    GetScreen(),
    strInfoScreen(),
    TableScreen(),
    ChartScreen(),
  ];

  void _onItentap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("simple stat app mk2"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white70,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "выборка",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: "значения",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "таблица",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart_outlined),
            label: "график",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItentap,
      ),
    );
  }
}
