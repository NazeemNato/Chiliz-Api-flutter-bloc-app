import 'package:chiliz_tracker_bloc/bloc/chiliz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // So we weed to use BlocBuilder in body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chiliz Api"),
      ),
      body:BlocBuilder<ChilizBloc,ChilizState>(
        builder: (context,state){
          return Container(
            child:_buildBody(state)
          );
        },
      )
    );
  }
   _buildBody(ChilizState state){
    if(state is ChilizLoading){
    return Center(child:CircularProgressIndicator());
    } else if(state is ChilizLoaded){
      return RefreshIndicator(onRefresh: () async{
        context.bloc<ChilizBloc>().add(RefreshChiliz());
      },
      child: ListView.builder(
            itemCount: state.coins.length,
            itemBuilder: (BuildContext context, int index) {
              final coin = state.coins[index];
            return ListTile(title: Text(coin.symbol,style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
            subtitle: Text(coin.volume),
            trailing: Text('PP ${coin.openPrice}'),
            );
           },
          ), 
      );
    } else if(state is ChilizError){
      return Center(child:Text('Error Loading data'));
    }
  }
}
