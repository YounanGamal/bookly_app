import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.DioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection time out withApi service');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send time out withApi service');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive time out withApi service');
      case DioExceptionType.badCertificate:
        return ServerFailure('Invalid SSL certificate detected');
      case DioExceptionType.badResponse:
        // return ServerFailure.fromResponse(
        //     dioError.response!.statusCode!, dioError.response!.data);
        if (dioError.response != null) {
          return ServerFailure.fromResponse(
            dioError.response!.statusCode!,
            dioError.response!.data,
          );
        }
        return ServerFailure('Received bad response from the server');
      case DioExceptionType.cancel:
        return ServerFailure('Request to api service cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error ,please try again!');
      default:
        return ServerFailure('Opps there was an error ,please try again');

    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found,please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internet server error,please try later!');
    } else {
      return ServerFailure('Opps there was an error ,please try again');
    }
  }
}
