import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/booke_model/booke_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatureBooksLoading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold(
      (failure) => emit(FeatureBooksFailure(failure.errorMessage)),
      (books) => emit(FeatureBooksSuccess(books)),
    );
  }
}
