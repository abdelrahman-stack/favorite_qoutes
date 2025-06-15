import 'package:favorite_quotes/cubits/add_fav_cubit/add_fav_cubit.dart';
import 'package:favorite_quotes/models/fav_model.dart';
import 'package:favorite_quotes/widgets/custom_button.dart';
import 'package:favorite_quotes/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

GlobalKey<FormState> formKey = GlobalKey();

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? title, subTitle;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomTextField(
            maxLines: 5,
            hint: 'Content',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            maxLines: 1,
            hint: 'Author',
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<AddFavCubit, AddFavState>(
            builder: (context, state) {
              return CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    BlocProvider.of<AddFavCubit>(
                      context,
                    ).addFav(FavModel(title!, subTitle!));
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
