import 'package:bookly_app/core/theme/style.dart';
import 'package:bookly_app/features/home/presentation/view/widget/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widget/feature_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeatureBooksListView(),
          SizedBox(
            height: 49,
          ),
          Text(
            'Best Seller',style: Style.textStyle18,
          ),
          SizedBox(height: 20,),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}
