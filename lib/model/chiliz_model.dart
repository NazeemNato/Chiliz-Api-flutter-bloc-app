//{"time":1590220416092,"symbol":"CAICHZ","volume":"0","quoteVolume":"0","lastPrice":"0","highPrice":"0","lowPrice":"0","openPrice":"0"},
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Coin extends Equatable {
  final String symbol;
  final String volume;
  final String openPrice;

  const Coin({
    @required this.symbol,
    @required this.volume,
    @required this.openPrice,
  });

  @override
  List<Object> get props => [symbol, volume, openPrice];

  @override
  String toString() =>
      'Coin {symbol:$symbol,volume:$volume,openPrice:$openPrice}';

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        symbol: json['symbol'] as String,
        volume: json['volume'] as String,
        openPrice: json['openPrice'] as String
    );
  }
}
