import 'package:bookly_app/core/routes/page_route_name.dart';
import 'package:bookly_app/features/home/presentation/view/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: PageRouteName.initial,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: PageRouteName.homeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: PageRouteName.bookDetailsView,
        builder: (context, state) => BookDetailsView(),
      ),
    ],
  );
}
