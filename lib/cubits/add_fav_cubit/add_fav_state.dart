part of 'add_fav_cubit.dart';

@immutable
sealed class AddFavState {}

final class AddFavInitial extends AddFavState {}

final class AddFavLoading extends AddFavState {}

final class AddFavSuccess extends AddFavState {
  
}

final class AddFavFailure extends AddFavState {
  final String errMessage;

  AddFavFailure(this.errMessage);
}
