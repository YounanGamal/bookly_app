import 'package:bookly_app/features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_action.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_rating.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/style.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: media.width * 0.17),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          textAlign: TextAlign.center,
          bookModel.volumeInfo.title ?? '',
          style: Style.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            textAlign: TextAlign.center,
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Style.textStyle18.copyWith(
                color: const Color(0xff707070), fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        BookRating(
          count: bookModel.volumeInfo.pageCount!,
          rating: bookModel.volumeInfo.contentVersion!.substring(0, 3),
        ),
        const SizedBox(
          height: 37,
        ),
        BookAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
