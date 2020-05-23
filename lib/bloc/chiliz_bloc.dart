import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chiliz_tracker_bloc/model/chiliz_model.dart';
import 'package:chiliz_tracker_bloc/repo/chiliz_repo.dart';
import 'package:equatable/equatable.dart';

part 'chiliz_event.dart';
part 'chiliz_state.dart';

class ChilizBloc extends Bloc<ChilizEvent, ChilizState> {
  // we goona use repo fn here instead of ui tree
  final ChilizRepo _chilizRepo;

  ChilizBloc({ChilizRepo chilizRepo})
      : assert(chilizRepo != null),
        _chilizRepo = chilizRepo;

  @override
  ChilizState get initialState => ChilizEmpty();

  @override
  Stream<ChilizState> mapEventToState(
    ChilizEvent event,
  ) async* {
    if(event is AppStarted){
      yield* _mapStartedtoState();
    }else if(event is RefreshChiliz){
      yield* _getRefreshCoins(coins:[]);
    }
  }
  Stream<ChilizState> _getRefreshCoins({List<Coin> coins}) async*{
    // Request to repo for updates
    try{
      List<Coin> newCoins = coins + await _chilizRepo.getData();
      yield ChilizLoaded(coins: newCoins);
    }catch(e){
    //Just like return we need to yield the state
    yield ChilizError();
    }
  }
  Stream<ChilizState> _mapStartedtoState() async*{
    yield ChilizLoading();
    // We need pass _get Refresh coins or get coin method to yield*
    yield*  _getRefreshCoins(coins:[]);
  }
}
