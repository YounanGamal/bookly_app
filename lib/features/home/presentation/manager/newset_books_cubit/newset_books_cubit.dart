import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/booke_model/booke_model.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit() : super(NewsetBooksInitial());
}
