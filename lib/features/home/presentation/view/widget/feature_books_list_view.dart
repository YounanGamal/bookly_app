import 'package:bookly_app/features/home/presentation/view/widget/feature_list_view_item.dart';
import 'package:flutter/material.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return SizedBox(
      height: media.size.height * .3,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 24),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FeatureListViewItem(),
          );
        },
      ),
    );
  }
}
