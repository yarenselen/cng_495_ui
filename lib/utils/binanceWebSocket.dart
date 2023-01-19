// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class BinanceWebSocket {
  late IOWebSocketChannel channel;
  late Stream stream;

  void connect(List<String> streamNames) {
    String streamString = streamNames.join("/");
    channel = IOWebSocketChannel.connect(
        "wss://stream.binance.com:443/stream?streams=$streamString");
    stream = channel.stream;
  }

  void send(String message) {
    channel.sink.add(message);
  }

  void disconnect() {
    channel.sink.close();
  }
}
