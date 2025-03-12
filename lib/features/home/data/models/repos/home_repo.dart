import 'package:bookly_app/features/home/data/models/bookly_model/book_model.dart';

abstract class HomeRepo {
  Future<List<BookModel>> fetchBestSellerBooks();
  Future<List<BookModel>> fetchFeaturedBooks();
}
