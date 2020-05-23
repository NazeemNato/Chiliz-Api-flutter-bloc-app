part of 'chiliz_bloc.dart';

abstract class ChilizEvent extends Equatable {
  const ChilizEvent();
// We need to call a props with empty list
  @override
  List<Object> get props => [];
}
// App have two events

// App stareted event this event will take place when we start our app
class AppStarted extends ChilizEvent {}
// Refresh event for refreshing dead coins
class RefreshChiliz extends ChilizEvent{}