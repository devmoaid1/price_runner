import 'package:get/get.dart';
import 'package:price_runner/core/api/api_consumer.dart';
import 'package:price_runner/core/api/http_consumer.dart';
import 'package:price_runner/data/datasources/product_remote_data_source.dart';
import 'package:price_runner/domain/repositories/product_repository.dart';
import 'package:price_runner/presentation/home_viewmodel.dart';

void setupLocator() {
  Get.lazyPut<ApiConsumer>(() => HttpConsumer());
  Get.lazyPut<ProductRemoteDatasource>(
      () => ProductRemoteDataSourceImpl(apiConsumer: Get.find()));

  Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(productRemoteDatasource: Get.find()));

  Get.lazyPut(() => HomeViewModel(productRepository: Get.find()), fenix: true);
}
