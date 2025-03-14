import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/routes/page_route_name.dart';
import 'package:bookly_app/core/theme/style.dart';
import 'package:bookly_app/features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_rating.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          PageRouteName.bookDetailsView,
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
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
                      child: Text(bookModel.volumeInfo.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Style.textStyle20.copyWith(
                            fontFamily: kGtSectraFine,
                          )),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      bookModel.volumeInfo.authors![0],
                      style: Style.textStyle14,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Free',
                          style: Style.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BookRating(
                          count: bookModel.volumeInfo.pageCount!,
                          rating: bookModel.volumeInfo.contentVersion!
                              .substring(0, 3),
                        ),
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
