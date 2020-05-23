import 'package:chiliz_tracker_bloc/bloc/chiliz_bloc.dart';
import 'package:chiliz_tracker_bloc/repo/chiliz_repo.dart';
import 'package:chiliz_tracker_bloc/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChilizBloc>(
      // This will provide chiliz data to the app
      // We need to trigger AppStarted event now
      // We need to use a chain operator and add AppStarted
      create: (_) => ChilizBloc(chilizRepo: ChilizRepo())..add(AppStarted()),
      child: MaterialApp(
        title: 'Chiliz Test',
        home: HomeScreen(),
      ),
    );
  }
}
