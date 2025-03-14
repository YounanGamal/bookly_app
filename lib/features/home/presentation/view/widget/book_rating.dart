import 'package:bookly_app/core/theme/style.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.count});
  final String rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          "$rating",
          style: Style.textStyle16,
        ),
        const SizedBox(
          width: 4,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            '($count)',
            style: Style.textStyle14,
          ),
        ),
      ],
    );
  }
}
