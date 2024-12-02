import 'package:bookly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return SizedBox(
      height: media.size.height * .3,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red,
            image: const DecorationImage(
              image: AssetImage(AppImages.imageBookHigh),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
