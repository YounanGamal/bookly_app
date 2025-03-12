part of 'feadured_books_cubit.dart';

sealed class FeaduredBooksState extends Equatable {
  const FeaduredBooksState();

  @override
  List<Object> get props => [];
}

final class FeaduredBooksInitial extends FeaduredBooksState {}

final class FeaduredBooksLoading extends FeaduredBooksState {}

final class FeaduredBooksFailure extends FeaduredBooksState {
  final String errMessage;
  const FeaduredBooksFailure(this.errMessage);
}

final class FeaduredBooksSuccess extends FeaduredBooksState {
  final List<BookModel> books;
  const FeaduredBooksSuccess(this.books);
}
