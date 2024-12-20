import 'package:bookly_app/core/theme/style.dart';
import 'package:bookly_app/features/home/presentation/view/widget/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widget/feature_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeatureBooksListView(),
                SizedBox(
                  height: 49,
                ),
                Text(
                  'Best Seller',
                  style: Style.textStyle18,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
