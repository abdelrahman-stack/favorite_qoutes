import 'package:bloc/bloc.dart';
import 'package:favorite_quotes/models/fav_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  List<FavModel>? notes;
  FavCubit() : super(FavInitial());
  void fetchAllFav()  {
    var box =  Hive.box<FavModel>('fav_model');
    notes =  box.values.toList();
    emit(FavSuccess());
  }
}
