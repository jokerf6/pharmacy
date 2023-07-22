import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:MyCareer/core/class/statusRequesr.class.dart';
import 'package:MyCareer/core/function/checkInternet.dart';
import 'package:http/http.dart' as http;

class crud {
  Future<Either<statusRequest, Map>> postData(String url, Map data) async {
    if (!await checkInternet()) {
      return const Left(statusRequest.offline);
    }
    var response = await http.post(Uri.parse(url), body: data);
    print("---------------------------------------");
    print(response);
    if (response.statusCode == 201 ||
        response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 409) {
      Map responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else {
      return const Left(statusRequest.badRequest);
    }
  }

  Future<Either<statusRequest, Map>> getData(String url) async {
    if (!await checkInternet()) {
      return const Left(statusRequest.offline);
    }
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 201 || response.statusCode == 200) {
      Map responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else if (response.statusCode == 404) {
      return const Left(statusRequest.notFound);
    } else {
      return const Left(statusRequest.serverError);
    }
  }

  Future<Either<statusRequest, Map>> getTokenData(
      String url, String token) async {
    if (!await checkInternet()) {
      return const Left(statusRequest.offline);
    }
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      "Authorization": 'Bearer $token'
    });
    print("enteeeeeeeeeeeeeeeeeeeeeeeeeeeer");

    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      Map responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else if (response.statusCode == 404) {
      return const Left(statusRequest.notFound);
    } else if (response.statusCode == 401) {
      return const Left(statusRequest.notAutherized);
    } else {
      return const Left(statusRequest.serverError);
    }
  }

  Future<Either<statusRequest, Map>> editTokenData(
      String url, String token, Map data) async {
    if (!await checkInternet()) {
      return const Left(statusRequest.offline);
    }
    print("MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM");
    print(data);
    var response = await http.patch(Uri.parse(url),
        body: data, headers: {"Authorization": 'Bearer $token'});
    print("Sssssssssssssssssssss");
    print(response);
    if (response.statusCode == 201 || response.statusCode == 200) {
      Map responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else if (response.statusCode == 404) {
      return const Left(statusRequest.notFound);
    } else if (response.statusCode == 401) {
      return const Left(statusRequest.notAutherized);
    } else {
      return const Left(statusRequest.serverError);
    }
  }

  Future<Either<statusRequest, Map>> postTokenData(
      String url, String token, Map data) async {
    if (!await checkInternet()) {
      return const Left(statusRequest.offline);
    }
    var response = await http.post(Uri.parse(url),
        body: data, headers: {"Authorization": 'Bearer $token'});
    if (response.statusCode == 201 || response.statusCode == 200) {
      Map responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else if (response.statusCode == 404) {
      return const Left(statusRequest.notFound);
    } else if (response.statusCode == 401) {
      return const Left(statusRequest.notAutherized);
    } else {
      return const Left(statusRequest.serverError);
    }
  }
}
