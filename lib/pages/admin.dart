// this page is for admin only.
// it should display the following:
// 1. total earnings for the week
// 2. most profitable coin for the week
// 3. least profitable coin for the week
// 4. total number of users
// 5. total number of trades
// 6. total number of coins
// 7. total number of coins in the watchlist

import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushReplacementNamed(context, '/register');
        break;
    }
  }

  int _total_number_of_users = 0;
  // function for fetching all the users from the database
  void _getUsers() {
    try {
      String url =
          'https://hdshr89om9.execute-api.eu-central-1.amazonaws.com/v1/users';

      // make a GET request to the server
      http.get(Uri.parse(url)).then((response) {
        // convert the response to a json object
        final resp = jsonDecode(response.body);

        // return the number of users
        _total_number_of_users = resp['data'].length;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    _getUsers();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel - Statistics'),
      ),
      // body needs to be updated to display the reports data in a listview.
      // the listview should display the following:
      // 1. total earnings for the week
      // 2. most profitable coin for the week
      // 3. least profitable coin for the week
      // 4. total number of users
      // 5. total number of trades
      // 6. total number of coins
      // 7. total number of coins in the watchlist

      body: ListView(
        // add space between the list items
        itemExtent: 80,

        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Total Earnings for the week: \$1000',
                style: TextStyle(fontSize: 20.0, color: Colors.green)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Most Profitable Coin: BTC',
                style: TextStyle(fontSize: 20.0, color: Colors.green)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Least Profitable Coin: ETH',
                style: TextStyle(fontSize: 20.0, color: Colors.green)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child:
                // call the function to get the number of users
                Text('Total Number of Users: $_total_number_of_users',
                    style:
                        const TextStyle(fontSize: 20.0, color: Colors.green)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Total Number of Trades: 1000',
                style: TextStyle(fontSize: 20.0, color: Colors.green)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Total Number of Coins: 22',
                style: TextStyle(fontSize: 20.0, color: Colors.green)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Total Number of Coins in Watchlist: 22',
                style: TextStyle(fontSize: 20.0, color: Colors.green)),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'User Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Exit',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
