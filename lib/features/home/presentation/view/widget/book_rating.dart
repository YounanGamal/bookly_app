import 'package:bookly_app/core/theme/style.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          '4.8',
          style: Style.textStyle16,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          '(2390)',
          style: Style.textStyle14,
        ),
      ],
    );
  }
}
