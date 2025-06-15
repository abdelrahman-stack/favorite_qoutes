import 'package:favorite_quotes/cubits/fav_cubit/fav_cubit.dart';
import 'package:favorite_quotes/models/fav_model.dart';
import 'package:favorite_quotes/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavModelAdapter());
  await Hive.openBox<FavModel>('fav_model');
  runApp(const FavoriteQoutes());
}

class FavoriteQoutes extends StatelessWidget {
  const FavoriteQoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit()..fetchAllFav(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF121212),
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
