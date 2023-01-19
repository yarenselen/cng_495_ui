// charts page receives data from binance websocket api
// wss://stream.binance.com:9443/ws/stream?streams=btcusdt@kline_1s/bnbusdt@kline_1s/ethusdt@kline_1s/xrpusdt@kline_1s/adabusdt@kline_1s/dotusdt@kline_1s/ltcusdt@kline_1s/uniusdt@kline_1s/atomusdt@kline_1s/bchusdt@kline_1s/xtzusdt@kline_1s/adausdt@kline_1s/ethusdt@kline_1s/bnbusdt@kline_1s/xrpusdt@kline_1s/dotusdt@kline_1s/ltcusdt@kline_1s/uniusdt@kline_1s/atomusdt@kline_1s/bchusdt@kline_1s/xtzusdt@kline_1s/adausdt@kline_1s/avaxusdt@kline_1s/neousdt@kline_1s/thetausdt@kline_1s/compusdt@kline_1s/renusdt@kline_1s/oneusdt@kline_1s/ftmusdt@kline_1s/fttusdt@kline_1s/bsvusdt@kline_1s/uniusdt@kline_1s/ltcusdt@kline_1s/ethusdt@kline_1s/bnbusdt@kline_1s/xrpusdt@kline_1s/dotusdt@kline_1s/ltcusdt@kline_1s/uniusdt@kline_1s/atomusdt@kline_1s/bchusdt@kline_1s/xtzusdt@kline_1s/adausdt@kline_1s/ethusdt@kline_1s/bnbusdt@kline_1s/xrpusdt@kline_1s/dotusdt@kline_1s/ltcusdt@kline_1s/uniusdt@kline_1s/atomusdt@kline_1s/bchusdt@kline_1s/xtzusdt@kline_1s/adausdt@kline_1s/avaxusdt@kline_1s/neousdt@kline_1s/thetausdt@kline_1s/compusdt@kline_1s/renusdt@kline_1s/oneusdt@kline_1s/ftmusdt@kline_1s/fttusdt@kline_1s/bsvusdt@kline_1s/uniusdt@kline_1s/ltcusdt@kline_1s/ethusdt@kline_1s/bnbusdt@kline_1s/xrpusdt@kline_1s/dotusdt@kline_1s/ltcusdt@kline_1s/uniusdt@kline_1s/
// create a list of market data with realtime update of prices in listview

import 'package:flutter/material.dart';
//import websocket
import 'package:web_socket_channel/io.dart';
//import json
import 'dart:convert';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
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
        Navigator.pushReplacementNamed(context, '/market');
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
        title: const Text('Market'),
      ),
      body: const Center(
        child: Text('Market'),
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
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        backgroundColor: Colors.black87,
      ),
    );
  }
}
