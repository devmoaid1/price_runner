import 'package:html/dom.dart';
import 'package:price_runner/core/api/api_consumer.dart';
import 'package:price_runner/core/constants/app_constats.dart';

import 'package:html/parser.dart' as parser;
import 'package:price_runner/core/errors/exceptions.dart';

abstract class ProductRemoteDatasource {
  Future<Document> getDubaiHtmlDocument();
  Future<Document> getAmazonHtmlDocument();
  Future<Document> getJumiaHtmlDocument();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDatasource {
  final ApiConsumer apiConsumer;

  ProductRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<Document> getAmazonHtmlDocument() async {
    try {
      var response = await apiConsumer.getData(path: AppConstants.amazonPath);

      final html =
          parser.parse(response); // parse the the response to html documtent

      return html;
    } catch (err) {
      throw ServerException(err.toString());
    }
  }

  @override
  Future<Document> getDubaiHtmlDocument() async {
    try {
      var response = await apiConsumer.getData(path: AppConstants.dubaiPath);

      final html =
          parser.parse(response); // parse the the response to html documtent

      return html;
    } catch (err) {
      throw ServerException(err.toString());
    }
  }

  @override
  Future<Document> getJumiaHtmlDocument() async {
    try {
      var response = await apiConsumer.getData(path: AppConstants.jumiaPath);

      final html =
          parser.parse(response); // parse the the response to html documtent

      return html;
    } catch (err) {
      throw ServerException(err.toString());
    }
  }
}
