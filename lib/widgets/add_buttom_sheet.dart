import 'package:favorite_quotes/cubits/add_fav_cubit/add_fav_cubit.dart';
import 'package:favorite_quotes/cubits/fav_cubit/fav_cubit.dart';
import 'package:favorite_quotes/widgets/add_note_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButtomSheet extends StatelessWidget {
  const AddButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: BlocProvider(
        create: (context) => AddFavCubit(),

        child: BlocConsumer<AddFavCubit, AddFavState>(
          listener: (context, state) {
            if (state is AddFavFailure) {}
            if (state is AddFavSuccess) {
              BlocProvider.of<FavCubit>(context).fetchAllFav();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return const SingleChildScrollView(child: AddNoteForm());
          },
        ),
      ),
    );
  }
}
