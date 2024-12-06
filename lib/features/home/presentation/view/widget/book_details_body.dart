import 'package:bookly_app/features/home/presentation/view/widget/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: media.width * 0.17),
            child: CustomBookImage.CustomBookImage(),
          ),
        ],
      ),
    );
  }
}
