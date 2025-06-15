import 'package:favorite_quotes/cubits/fav_cubit/fav_cubit.dart';
import 'package:favorite_quotes/models/fav_model.dart';
import 'package:favorite_quotes/widgets/add_note_form.dart';
import 'package:favorite_quotes/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final FavModel note;
  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

String? title, content;

class _EditViewBodyState extends State<EditViewBody> {
  @override
  void initState() {
    BlocProvider.of<FavCubit>(context).fetchAllFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Edit Favorite Qoutes',
                style: TextStyle(fontSize: 24),
              ),

              IconButton(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = subTitle ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<FavCubit>(context).fetchAllFav();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 50),

          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.title,
            maxLines: 6,
          ),
          const SizedBox(height: 24),
          CustomTextField(
              onChanged: (value) {
              subTitle = value;
            },
            hint: widget.note.subTitle, maxLines: 1),
        ],
      ),
    );
  }
}
