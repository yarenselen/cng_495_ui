// Notifications Page (lib/pages/notifications.dart)
// it is a list of notifications that are received from the server.
// use listview to display the list of notifications

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedIndex = 2;

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
        title: const Text('Notifications'),
      ),
      // add a listview to display the notifications with title and subtitle.
      // title should include a notification icon and the notification message
      // subtitle should include the time the notification was received
      body: ListView(
        padding: const EdgeInsets.all(8),
        // add space between the list items
        itemExtent: 80,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.brown[200],
            child: const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Your weekly report is ready'),
              subtitle: Text('You can view your weekly report in the reports'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.brown[200],
            child: const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Check out increase in BTC price'),
              subtitle: Text('BTC price has increased by 10%'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.brown[200],
            child: const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Wow! ETH price has increased by 20%'),
              subtitle: Text('ETH price has reached 2000 dollars!'),
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
            label: 'Market',
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
