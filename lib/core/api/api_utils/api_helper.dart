import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

// import 'package:http/http.dart' as api;

import 'network_exception.dart';

import 'response_handler.dart';

class API {
  //API client
  // static var client = api.Client();
  Dio dio = Dio();



  Future get(String url, header, {hideLog = false}) async {
    var responseJson;
    try {
      Response res;
      if (header != null) {
        res = await dio.get(
          url,
          options: Options(
            headers: header,
            sendTimeout: const Duration(seconds: 20),
            receiveTimeout: const Duration(seconds: 20),
          ),
        );
        responseJson = res.toString();
      } else {
        res = await dio.get(url);
        print("$res");
        responseJson = res.toString();
      }
    } on SocketException {
      throw NetworkException("Network error occurred");
    } on DioException catch (e) {
      log("in dio exception");
      print("${e.response}");

      responseJson = await responseHandler(e.response ??
          Response(
              requestOptions: RequestOptions(),
              statusCode: 500,
              statusMessage: "Error"));
    }
    print(responseJson);
    return responseJson;
  }

  Future post(String url, header, body, {FormData? multimediaRequest}) async {
    var responseJson;
    if (multimediaRequest == null) {
      log("no media post");
      try {
        log("in try");
        Response res = await dio.post(
          url,
          data: body,
          options: Options(
            headers: header,
            responseType: ResponseType.plain,
            // sendTimeout: Duration(seconds: 20),
            // receiveTimeout: Duration(seconds: 20),
          ),
        );
        responseJson = res.toString();
        log("try completed");
      } on SocketException {
        throw NetworkException("Network error occurred");
      } on DioException catch (e) {
        log("in dio exception");
        print(e);
        responseJson = await responseHandler(e.response ??
            Response(
                requestOptions: RequestOptions(),
                statusCode: 500,
                statusMessage: "Error"));
      }
      log(responseJson);
      return responseJson;
    } else {
      log("media post");

      try {
        log("in try");

        Response res = await dio.post(
          url,
          data: multimediaRequest,
          options: Options(
            method: 'POST',
            contentType: "application/json",
            headers: header,
            responseType: ResponseType.plain,
            // connectTimeout: Duration(seconds: 60),
            // sendTimeout: Duration(seconds: 20),
            // receiveTimeout: Duration(seconds: 20),
          ),
        );
        print(res);
        responseJson = res.toString();
        log("try completed");
        return res.data;
      } on SocketException {
        throw NetworkException();
      } on DioException catch (e) {
        log("in dio exception");
        print(e);
        responseJson = await responseHandler(e.response ??
            Response(
                requestOptions: RequestOptions(),
                statusCode: 500,
                statusMessage: "Error"));
      }
      print(responseJson);

      return responseJson;
    }
  }

  Future put(String url, header, body, {FormData? multimediaRequest}) async {
    var responseJson;
    if (multimediaRequest == null) {
      try {
        var res = await dio.put(
          url,
          data: body,
          options: Options(
            headers: header,
            sendTimeout: const Duration(seconds: 20),
            receiveTimeout: const Duration(seconds: 20),
          ),
        );
        print(res);

        responseJson = res.toString();
      } on SocketException {
        //network error
        throw NetworkException("Network error occurred");
      }
      print(responseJson);

      return responseJson;
    } else {
      Dio dio = Dio();
      try {
        Response res = await dio.put(
          url,
          data: multimediaRequest,
          options: Options(
            method: 'PUT',
            contentType: "application/json",
            headers: header,
            responseType: ResponseType.plain,
          ),
        );
        print(res);

        responseJson = res.toString();
      } on SocketException {
        throw NetworkException();
      } on DioException catch (e) {
        log("in dio exception");
        responseJson = await responseHandler(e.response ??
            Response(
                requestOptions: RequestOptions(),
                statusCode: 500,
                statusMessage: "Error"));
      }
      print(responseJson);

      return responseJson;
    }
  }

  Future patch(String url, header, {body}) async {
    var responseJson;
    print("DATA SENT:: $url\n$header\n$body ");
    try {
      var res = await dio.patch(
        url,
        data: body,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      );
      responseJson = res.toString();
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    } on DioException catch (e) {
      log("in dio exception");
      responseJson = await responseHandler(e.response ??
          Response(
              requestOptions: RequestOptions(),
              statusCode: 500,
              statusMessage: "Error"));
    }
    return responseJson;
  }

  Future delete(String url, header, body) async {
    var responseJson;
    try {
      var res = await dio.delete(url,
          data: body,
          options: Options(
            headers: header,
            sendTimeout: const Duration(seconds: 20),
            receiveTimeout: const Duration(seconds: 20),
          ));
      print(res);
      responseJson = res.toString();
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    } on DioException catch (e) {
      log("in dio exception");
      responseJson = await responseHandler(e.response ??
          Response(
              requestOptions: RequestOptions(),
              statusCode: 500,
              statusMessage: "Error"));
    }
    print(responseJson);
    return responseJson;
  }
}
