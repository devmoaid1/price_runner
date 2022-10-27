import 'package:html/dom.dart';
import 'package:price_runner/core/api/api_consumer.dart';
import 'package:price_runner/core/constants/app_constats.dart';

import 'package:html/parser.dart' as parser;

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
    var response = await apiConsumer.getData(path: AppConstants.amazonPath);

    final html = parser.parse(response);

    return html;
  }

  @override
  Future<Document> getDubaiHtmlDocument() async {
    var response = await apiConsumer.getData(path: AppConstants.dubaiPhone);

    final html = parser.parse(response);

    return html;
  }

  @override
  Future<Document> getJumiaHtmlDocument() async {
    var response = await apiConsumer.getData(path: AppConstants.jumiaPath);
    final html = parser.parse(response);

    return html;
  }
}
