import 'package:bookly_app/features/home/presentation/view/widget/book_list_view_item.dart';
import 'package:flutter/material.dart';

class NewsetListView extends StatelessWidget {
  const NewsetListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
    );
  }
}
