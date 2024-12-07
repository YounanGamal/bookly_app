import 'package:bookly_app/core/theme/style.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          size: 14,
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
        Opacity(
          opacity: 0.5,
          child: Text(
            '(2390)',
            style: Style.textStyle14,
          ),
        ),
      ],
    );
  }
}
