import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/routes/generator_routes.dart';
import 'package:bookly_app/core/routes/page_route_name.dart';
import 'package:bookly_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      // theme: AppTheme.themeData,
      initialRoute: PageRouteName.initial,
      onGenerateRoute: GeneratorRoutes.onGenerator,
    );
  }
}
