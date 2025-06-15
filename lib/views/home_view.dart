import 'package:favorite_quotes/widgets/add_buttom_sheet.dart';
import 'package:favorite_quotes/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Qoutes', style: TextStyle(fontSize: 24)),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6C63FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,

            context: context,
            builder: (context) {
              return const AddButtomSheet();
            },
          );
        },
      ),
    );
  }
}
