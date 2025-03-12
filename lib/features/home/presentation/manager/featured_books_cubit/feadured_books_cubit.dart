import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'feadured_books_state.dart';

class FeaduredBooksCubit extends Cubit<FeaduredBooksState> {
  FeaduredBooksCubit() : super(FeaduredBooksInitial());
}
