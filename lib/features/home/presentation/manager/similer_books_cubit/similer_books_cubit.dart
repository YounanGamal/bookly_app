import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.repoImpl) : super(SimilerBooksInitial());
  HomeRepoImpl repoImpl;
  Future<void> fetchSimilerBooks({required String category}) async {
    emit(SimilerBooksLoading());
    var result = await repoImpl.fetchSimilerBooks(category: category);
    result.fold((failure) => emit(SimilerBooksFailure(failure.errorMessage)),
        (books) => emit(SimilerBooksSuccess(books)));
  }
}
