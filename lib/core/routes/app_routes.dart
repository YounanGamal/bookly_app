import 'package:bookly_app/core/routes/page_route_name.dart';
import 'package:bookly_app/core/services/service_locator.dart';
import 'package:bookly_app/features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/search/presentetion/view/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: PageRouteName.initial,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: PageRouteName.homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: PageRouteName.searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: PageRouteName.bookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilerBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
