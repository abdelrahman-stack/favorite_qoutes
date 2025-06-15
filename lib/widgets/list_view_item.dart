import 'package:favorite_quotes/cubits/fav_cubit/fav_cubit.dart';
import 'package:favorite_quotes/models/fav_model.dart';
import 'package:favorite_quotes/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            if (state is FavSuccess) {
              List<FavModel> notes =
              BlocProvider.of<FavCubit>(context).notes!;
              return ListView.builder(
                itemCount:notes.length ,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),

                    child: CustomCard(note: notes[index] ,),
                  );
                },
              );
            } else {
              return const Center(child: Text('There was an error '));
            }
          },
        ),
      ),
    );
  }
}
