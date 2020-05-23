part of 'chiliz_bloc.dart';

abstract class ChilizState extends Equatable {
  const ChilizState();
  @override
  List<Object> get props => [];
}

// Initial State
class ChilizEmpty extends ChilizState{}
// Loading state
class ChilizLoading extends ChilizState{}
//Loaded state
class ChilizLoaded extends ChilizState{
  // Once the app load we need to keep app statable
  final List<Coin> coins;

  const ChilizLoaded({this.coins});

  // We need props to compare different coins to each other
  @override
  List<Object> get props => [coins];
  
  @override
  String toString() =>'ChilizLoaded {coins:$coins}';
}
// Error state
class ChilizError extends ChilizState{}