import 'package:bloc/bloc.dart';
import 'package:favorite_quotes/models/fav_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'add_fav_state.dart';

class AddFavCubit extends Cubit<AddFavState> {
  AddFavCubit() : super(AddFavInitial());

  void addFav(FavModel fav) {
    emit(AddFavLoading());
    try {
      var box = Hive.box<FavModel>('fav_model');
      box.add(fav);
      emit(AddFavSuccess());
    } catch (e) {
      emit(AddFavFailure(e.toString()));
    }
  }
}
