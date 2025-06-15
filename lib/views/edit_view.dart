import 'package:favorite_quotes/models/fav_model.dart';
import 'package:favorite_quotes/widgets/edit_view_body.dart';
import 'package:flutter/material.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.note});
final FavModel note;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: EditViewBody(note: note ));
  }
}
