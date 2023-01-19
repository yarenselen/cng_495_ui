// use the kline class in the dashboard screen to fetch data via websocket and display it in listview builder widget
// Path: lib/pages/dashboard.dart
import 'dart:async';
import 'dart:developer';

import 'package:cng_495_ui/model/kline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

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

  // build widget with cupertino navigation bar
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

// import 'dart:async';
// import 'dart:developer';

// import 'package:cng_495_ui/model/kline.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         Navigator.pushReplacementNamed(context, '/login');
//         break;
//       case 1:
//         Navigator.pushReplacementNamed(context, '/market');
//         break;
//       case 2:
//         Navigator.pushReplacementNamed(context, '/notifications');
//         break;
//       case 3:
//         Navigator.pushReplacementNamed(context, '/profile');
//         break;
//     }
//   }

//   // build widget with cupertino navigation bar
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Market',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Notifications',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//       tabBuilder: (context, index) {
//         return CupertinoTabView(
//           builder: (context) {
//             return CupertinoPageScaffold(
//               child: Center(
//                 child: FutureBuilder<List<Kline>>(
//                   future: fetchKlines(http.Client()),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) print(snapshot.error);

//                     return snapshot.hasData
//                         ? KlineList(snapshot.data!)
//                         : const Center(child: CircularProgressIndicator());
//                   },
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   // fetch klines from the api
//   Future<List<Kline>> fetchKlines(http.Client client) async {
//     final response = await client.get(Uri.parse(
//         'https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1d&limit=10'));

//     return parseKlines(response.body);
//   }

//   // parse klines from the api
//   List<Kline> parseKlines(String responseBody) {
//     final parsed = jsonDecode(responseBody);

//     log(parsed.toString());

//     log(parsed.map<Kline>((json) => Kline.fromJson(json)).toString());

//     return parsed.map<Kline>((json) => Kline.fromJson(json)).toList();
//   }

//   // build kline list
//   Widget KlineList(List<Kline> klines) {
//     return ListView.builder(
//       itemCount: klines.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(klines[index].date),
//           subtitle: Text(klines[index].open.toString()),
//         );
//       },
//     );
//   }

//   // build kline list item
//   Widget KlineListItem(Kline kline) {
//     return ListTile(
//       title: Text(kline.date),
//       subtitle: Text(kline.open.toString()),
//     );
//   }
// }
