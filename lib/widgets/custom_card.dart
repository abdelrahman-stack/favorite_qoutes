import 'package:favorite_quotes/cubits/fav_cubit/fav_cubit.dart';
import 'package:favorite_quotes/models/fav_model.dart';
import 'package:favorite_quotes/views/edit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.note});
  final FavModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  EditView(note: note,);
            },
          ),
        );
      },
      child: SizedBox(
        height: 180,
        width: MediaQuery.of(context).size.width,

        child: Card(
          color: const Color(0xFF2C2C2C),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Column(
              children: [
                                const SizedBox(height: 16),

                Text(
                  note.title,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      note.subTitle,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<FavCubit>(context).fetchAllFav();
                      },
                      icon: const Icon(Icons.delete, size: 28),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
