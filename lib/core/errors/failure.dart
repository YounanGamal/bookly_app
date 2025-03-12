import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.formResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure('Request to API server was canceled');
      case DioExceptionType.connectionError:
        return const ServerFailure('Connection error');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return const ServerFailure('No internet connection');
        }
        return const ServerFailure(
            'Unexpected error occurred, please try again!');

      default:
        return const ServerFailure(
            'Opps there was an error, please try later!');
    }
  }

  factory ServerFailure.formResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return const ServerFailure('Your request not found, please try later!');
    } else if (statusCode == 500) {
      return const ServerFailure('Internal server error, please try later!');
    } else {
      return const ServerFailure('Opps there was an error, please try later!');
    }
  }
}
