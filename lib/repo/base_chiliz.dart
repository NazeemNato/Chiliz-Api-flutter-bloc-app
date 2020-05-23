import 'package:chiliz_tracker_bloc/model/chiliz_model.dart';

abstract class BaseChilizRepo{
  Future<List<Coin>> getData();
  void dispose();
}