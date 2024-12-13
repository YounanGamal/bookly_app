import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/booke_model/booke_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewSetBooks();
    result.fold(
      (failure) {
        emit(NewsetBooksFailure(failure.errorMessage));
      },
      (books) {
        emit(NewsetBooksSuccess(books));
      },
    );
  }
}
