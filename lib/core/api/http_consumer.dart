import 'package:flutter/material.dart';
import 'package:price_runner/core/api/api_consumer.dart';
import 'package:http/http.dart' as http;

import '../errors/exceptions.dart';

class HttpConsumer implements ApiConsumer {
  @override
  Future getData({required String path}) async {
    var response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw const ServerException();
    }
  }
}
