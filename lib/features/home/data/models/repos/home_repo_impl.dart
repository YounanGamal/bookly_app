import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/services/api_service.dart';
import 'package:bookly_app/features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newset&q=computer scince');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(
          ServerFailure.fromDioError(e)); // Convert Dio error into failure
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioError(e),
      ); // Convert Dio error into failure
    } catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilerBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioError(e),
      ); // Convert Dio error into failure
    } catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
