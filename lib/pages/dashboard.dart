// create flutter navigation bar at the bottom of the screen

// Path: lib/pages/dashboard.dart
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:cng_495_ui/model/kline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:cng_495_ui/utils/binanceWebSocket.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  BinanceWebSocket _binanceWebSocket = BinanceWebSocket();
  Map<String, KlineStream> _data = {};

  @override
  void initState() {
    super.initState();

    _binanceWebSocket.connect([
      "btcusdt@kline_1s",
      "ethusdt@kline_1s",
      "ltcusdt@kline_1s",
      "bnbusdt@kline_1s",
      "avaxusdt@kline_1s",
      "solusdt@kline_1s",
      "adausdt@kline_1s",
      "dogeusdt@kline_1s",
      "dotusdt@kline_1s",
      "linkusdt@kline_1s",
      "xlmusdt@kline_1s",
      "xrpusdt@kline_1s",
      "ethbtc@kline_1s",
      "ltcbtc@kline_1s",
      "bnbbtc@kline_1s",
      "avaxbtc@kline_1s",
      "solbtc@kline_1s",
      "adabtc@kline_1s",
      "dogebtc@kline_1s",
      "dotbtc@kline_1s",
      "linkbtc@kline_1s",
      "xlmbtc@kline_1s",
      "xrpbtc@kline_1s",
    ]);
    _binanceWebSocket.stream.listen((data) {
      setState(() {
        // check if the data is map
        if (data is Map) {
          developer.log("data is map");
          // get the symbol from the stream
          String symbol = data["stream"].split("@")[0];
          // get the kline data from the stream
          KlineStream klineStream = KlineStream.fromJson(data["data"]);
          // add the kline data to the map
          _data[symbol] = klineStream;
        } else {
          developer.log("data is not map");
          // if the data is not map, it is a string
          // convert the string to map
          Map<String, dynamic> dataMap = jsonDecode(data);
          developer.log("dataMap$dataMap");
          // get the symbol from the stream
          String symbol = dataMap["stream"].split("@")[0];
          developer.log("symbol$symbol");
          // get the kline data from the stream
          KlineStream klineStream = KlineStream.fromMap(dataMap);
          developer.log("klineStream$klineStream");
          // add the kline data to the map
          _data[symbol] = klineStream;
        }
        // log the data
        developer.log("final$_data");
      });
    });
  }

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
//             label: 'Search',
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
//       ),
//       tabBuilder: (BuildContext context, int index) {
//         return CupertinoTabView(
//           builder: (BuildContext context) {
//             return _widgetOptions.elementAt(index);
//           },
//         );
//       },
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watchlist"),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          String symbol = _data.keys.elementAt(index);
          KlineStream klineStream = _data[symbol]!;
          return ListTile(
            title: Text(symbol.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                )),
            subtitle:
                // Column(
                //   children: [
                //     Text(
                //       klineStream.data?.kline.openPrice ?? "",
                //       style: TextStyle(
                //           color: klineStream.data?.kline.openPrice != null
                //               ? Colors.grey[700]
                //               : Colors.black),
                //       textAlign: TextAlign.left,
                //     ),
                //     Text(
                //       klineStream.data?.kline.closePrice ?? "",
                //       style: TextStyle(
                //           color: klineStream.data?.kline.closePrice != null
                //               ? // if close price is greater than open price, color is green
                //               // if close price is less than open price, color is red
                //               // convert string to double
                //               double.parse(klineStream.data?.kline.closePrice ??
                //                       "") >
                //                       double.parse(
                //                           klineStream.data?.kline.openPrice ??
                //                               "")
                //                   ? Colors.green
                //                   : Colors.red
                //               : Colors.black),
                //       textAlign: TextAlign.left,
                //     ),
                //   ],
                // ),
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // text with icon up and down to show if the price is up or down
                  klineStream.data?.kline.closePrice != null
                      ? // if close price is greater than open price, color is green
                      // if close price is less than open price, color is red
                      // convert string to double
                      double.parse(klineStream.data?.kline.closePrice ?? "") >
                              double.parse(
                                  klineStream.data?.kline.openPrice ?? "")
                          ? "${klineStream.data?.kline.closePrice} ▲"
                          : "${klineStream.data?.kline.closePrice} ▼"
                      : "",
                  style: TextStyle(
                      color: klineStream.data?.kline.closePrice != null
                          ? // if close price is greater than open price, color is green
                          // if close price is less than open price, color is red
                          // convert string to double
                          double.parse(klineStream.data?.kline.closePrice ??
                                      "") >
                                  double.parse(
                                      klineStream.data?.kline.openPrice ?? "")
                              ? Colors.green
                              : Colors.red
                          : Colors.black),
                  textAlign: TextAlign.left,
                ),
                Text(
                  // random number between 0 and 15 as string
                  "Earnings: %${Random().nextInt(15)}",
                  style: TextStyle(color: Colors.grey[700]),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            // Text(
            //   klineStream.data?.kline.closePrice ?? "",
            //   style: TextStyle(
            //       color: klineStream.data?.kline.closePrice != null
            //           ? // if close price is greater than open price, color is green
            //           // if close price is less than open price, color is red
            //           // convert string to double
            //           double.parse(klineStream.data?.kline.closePrice ?? "") >
            //                   double.parse(
            //                       klineStream.data?.kline.openPrice ?? "")
            //               ? Colors.green
            //               : Colors.red
            //           : Colors.black),
            //   textAlign: TextAlign.left,
            // ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            selectedColor: Colors.blue,
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => DetailScreen(
            //                 symbol: symbol,
            //                 klineStream: klineStream,
            //               )));
            // },
          );
        },
      ),
      // bottomNavigationBar with background color is black87
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
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        backgroundColor: Colors.black87,
      ),
    );
  }

  @override
  void dispose() {
    _binanceWebSocket.disconnect();
    super.dispose();
  }
}
