import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'feadured_books_state.dart';

class FeaduredBooksCubit extends Cubit<FeaduredBooksState> {
  FeaduredBooksCubit(this.homeRepo) : super(FeaduredBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaduredBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) => emit(FeaduredBooksFailure(failure.errorMessage)),
      (books) => emit(
        FeaduredBooksSuccess(books),
      ),
    );
  }
}
