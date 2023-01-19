// generate earnings report for the week and display it in the reports page.
// report is very simple and should include the following:
// 1. total earnings for the week
// 2. most profitable coin for the week
// 3. least profitable coin for the week

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/login');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/reports');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/notifications');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      // body needs to be updated to display the reports data in a listview.
      // the listview should display the following:
      // 1. total earnings for the week
      // 2. most profitable coin for the week
      // 3. least profitable coin for the week

      body: ListView(
        // add space between the list items
        itemExtent: 80,

        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.brown[200],
            child: const ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text('Total Earnings for the week'),
              subtitle: Text('Earning Percentage: 10%. Total Earnings: \$1000'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.brown[200],
            // divide the listview row into 4 columns
            // 1. icon
            // 2. total earnings for the week
            // 3. most profitable coin for the week
            // 4. least profitable coin for the week
            child: const ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text('Most profitable coin for the week'),
              subtitle: Text('ETH: up 20%'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.brown[200],
            child: const ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text('Least profitable coin for the week'),
              subtitle: Text('LTC: down 10%'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_rounded),
            label: 'Reports',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black87,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
