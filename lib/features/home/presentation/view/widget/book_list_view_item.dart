import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/routes/page_route_name.dart';
import 'package:bookly_app/core/theme/style.dart';
import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(PageRouteName.bookDetailsView);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.imageBookHigh),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: media.size.width * 0.5,
                      child: Text('Harry Potter and the Goblet of Fire',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Style.textStyle20.copyWith(
                            fontFamily: kGtSectraFine,
                          )),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'J.K. Rowling',
                      style: Style.textStyle14,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '19.99 €',
                          style: Style.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const BookRating(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
