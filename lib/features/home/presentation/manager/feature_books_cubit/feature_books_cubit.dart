import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/booke_model/booke_model.dart';
import 'package:meta/meta.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit() : super(FeatureBooksInitial());
}
