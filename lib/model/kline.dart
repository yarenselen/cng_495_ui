// ignore_for_file: public_member_api_docs, sort_constructors_first
// Parse kline data from json to dart object
// The following json is parsed to a dart object:
// {
//   "stream": "bnbbtc@kline_1m", // Stream name
//  "data": {

//   "e": "kline",     // Event type
//   "E": 123456789,   // Event time
//   "s": "BNBBTC",    // Symbol
//   "k": {
//     "t": 123400000, // Kline start time
//     "T": 123460000, // Kline close time
//     "s": "BNBBTC",  // Symbol
//     "i": "1m",      // Interval
//     "f": 100,       // First trade ID
//     "L": 200,       // Last trade ID
//     "o": "0.0010",  // Open price
//     "c": "0.0020",  // Close price
//     "h": "0.0025",  // High price
//     "l": "0.0015",  // Low price
//     "v": "1000",    // Base asset volume
//     "n": 100,       // Number of trades
//     "x": false,     // Is this kline closed?
//     "q": "1.0000",  // Quote asset volume
//     "V": "500",     // Taker buy base asset volume
//     "Q": "0.500",   // Taker buy quote asset volume
//     "B": "123456"   // Ignore
//   }
// }
// }

// use standard dart json decoder to parse json to dart object
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

class KlineStream {
  String? stream;
  Data? data;

  KlineStream({
    this.stream,
    this.data,
  });

  factory KlineStream.fromJson(Map<String, dynamic> json) => KlineStream(
        stream: json["stream"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "stream": stream,
        "data": data?.toJson(),
      };

  // from string to KlineStream
  factory KlineStream.fromString(String json) {
    return KlineStream.fromJson(jsonDecode(json));
  }

  KlineStream copyWith({
    String? stream,
    Data? data,
  }) {
    return KlineStream(
      stream: stream ?? this.stream,
      data: data!,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stream': stream,
      'data': data?.toMap(),
    };
  }

  factory KlineStream.fromMap(Map<String, dynamic> map) {
    return KlineStream(
      stream: map['stream'],
      data: Data.fromMap(map['data']),
    );
  }

  @override
  String toString() {
    return 'KlineStream(stream: $stream, data: $data)';
  }

  @override
  bool operator ==(covariant KlineStream other) {
    if (identical(this, other)) return true;

    return other.stream == stream && other.data == data;
  }

  @override
  int get hashCode {
    return stream.hashCode ^ data.hashCode;
  }
}

class Data {
  Data({
    required this.eventType,
    required this.eventTime,
    required this.symbol,
    required this.kline,
  });

  String eventType;
  int eventTime;
  String symbol;
  Kline kline;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        eventType: json["e"],
        eventTime: json["E"],
        symbol: json["s"],
        kline: Kline.fromJson(json["k"]),
      );

  Map<String, dynamic> toJson() => {
        "e": eventType,
        "E": eventTime,
        "s": symbol,
        "k": kline.toJson(),
      };

  // fromMap is used to convert map to Data object
  factory Data.fromMap(Map<String, dynamic> map) {
    log('klinestream from map');
    log('event type: ${map['e']}');
    log('event time: ${map['E']}');
    // log type of event time
    log('event time type: ${map['E'].runtimeType}');
    log('symbol: ${map['s']}');
    log('kline: ${map['k']}');
    return Data(
      eventType: map['e'],
      eventTime: map['E'],
      symbol: map['s'],
      kline: Kline.fromMap(map['k']),
    );
  }

  // toMap is used to convert Data object to map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'e': eventType,
      'E': eventTime,
      's': symbol,
      'k': kline.toMap(),
    };
  }

  Data copyWith({
    String? eventType,
    int? eventTime,
    String? symbol,
    Kline? kline,
  }) {
    return Data(
      eventType: eventType ?? this.eventType,
      eventTime: eventTime ?? this.eventTime,
      symbol: symbol ?? this.symbol,
      kline: kline ?? this.kline,
    );
  }

  @override
  String toString() {
    return 'Data(eventType: $eventType, eventTime: $eventTime, symbol: $symbol, kline: $kline)';
  }
}

class Kline {
  Kline({
    required this.startTime,
    required this.closeTime,
    required this.symbol,
    required this.interval,
    required this.firstTradeId,
    required this.lastTradeId,
    required this.openPrice,
    required this.closePrice,
    required this.highPrice,
    required this.lowPrice,
    required this.baseAssetVolume,
    required this.numberOfTrades,
    required this.isKlineClosed,
    required this.quoteAssetVolume,
    required this.takerBuyBaseAssetVolume,
    required this.takerBuyQuoteAssetVolume,
    required this.ignore,
  });

  int startTime;
  int closeTime;
  String symbol;
  String interval;
  int firstTradeId;
  int lastTradeId;
  String openPrice;
  String closePrice;
  String highPrice;
  String lowPrice;
  String baseAssetVolume;
  int numberOfTrades;
  bool isKlineClosed;
  String quoteAssetVolume;
  String takerBuyBaseAssetVolume;
  String takerBuyQuoteAssetVolume;
  String ignore;

  factory Kline.fromJson(Map<String, dynamic> json) => Kline(
        startTime: json["t"],
        closeTime: json["T"],
        symbol: json["s"],
        interval: json["i"],
        firstTradeId: json["f"],
        lastTradeId: json["L"],
        openPrice: json["o"],
        closePrice: json["c"],
        highPrice: json["h"],
        lowPrice: json["l"],
        baseAssetVolume: json["v"],
        numberOfTrades: json["n"],
        isKlineClosed: json["x"],
        quoteAssetVolume: json["q"],
        takerBuyBaseAssetVolume: json["V"],
        takerBuyQuoteAssetVolume: json["Q"],
        ignore: json["B"],
      );

  Map<String, dynamic> toJson() => {
        "t": startTime,
        "T": closeTime,
        "s": symbol,
        "i": interval,
        "f": firstTradeId,
        "L": lastTradeId,
        "o": openPrice,
        "c": closePrice,
        "h": highPrice,
        "l": lowPrice,
        "v": baseAssetVolume,
        "n": numberOfTrades,
        "x": isKlineClosed,
        "q": quoteAssetVolume,
        "V": takerBuyBaseAssetVolume,
        "Q": takerBuyQuoteAssetVolume,
        "B": ignore,
      };

  // from string to Kline
  factory Kline.fromString(String json) {
    return Kline.fromJson(jsonDecode(json));
  }

  // from map to Kline
  factory Kline.fromMap(Map<String, dynamic> map) {
    log('Kline.fromMap');
    // log openPrice type
    log('openPrice type: ${map['o'].runtimeType}');
    return Kline(
      startTime: map['t'],
      closeTime: map['T'],
      symbol: map['s'],
      interval: map['i'],
      firstTradeId: map['f'],
      lastTradeId: map['L'],
      openPrice: map['o'],
      closePrice: map['c'],
      highPrice: map['h'],
      lowPrice: map['l'],
      baseAssetVolume: map['v'],
      numberOfTrades: map['n'],
      isKlineClosed: map['x'],
      quoteAssetVolume: map['q'],
      takerBuyBaseAssetVolume: map['V'],
      takerBuyQuoteAssetVolume: map['Q'],
      ignore: map['B'],
    );
  }

  // from Kline to map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'startTime': startTime,
      'closeTime': closeTime,
      'symbol': symbol,
      'interval': interval,
      'firstTradeId': firstTradeId,
      'lastTradeId': lastTradeId,
      'openPrice': openPrice,
      'closePrice': closePrice,
      'highPrice': highPrice,
      'lowPrice': lowPrice,
      'baseAssetVolume': baseAssetVolume,
      'numberOfTrades': numberOfTrades,
      'isKlineClosed': isKlineClosed,
      'quoteAssetVolume': quoteAssetVolume,
      'takerBuyBaseAssetVolume': takerBuyBaseAssetVolume,
      'takerBuyQuoteAssetVolume': takerBuyQuoteAssetVolume,
      'ignore': ignore,
    };
  }
}
