import 'package:get/get.dart';
import 'package:price_runner/data/models/price_model.dart';
import 'package:price_runner/domain/repositories/product_repository.dart';

import '../data/models/product.dart';

class HomeViewModel extends GetxController {
  final ProductRepository productRepository;

  Product? _product;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<PriceModel> _prices = [];

  List<PriceModel> get prices => _prices;

  @override
  void onInit() {
    super.onInit();
    getProductDetails();
  }

  HomeViewModel({required this.productRepository});
  Product? get product => _product;

  Future<List<Product>> _getProductFromAllStores() async {
    List<Product> products = [];
    final amazonProduct = await productRepository.getAmazonProduct();
    final dubaiProduct = await productRepository.getDubaiStoreProduct();
    final jumiaProduct = await productRepository.getJumiaProduct();

    products.add(dubaiProduct);
    products.add(amazonProduct);
    products.add(jumiaProduct);

    return products;
  }

  Future<void> getProductDetails() async {
    final products = await _getProductFromAllStores();

    _product = products.where((element) => element.name.isNotEmpty).toList()[0];

    _prices = List.generate(
        products.length,
        ((index) => PriceModel(
            storeImagePath: '',
            storeName: products[index].storeName,
            productPrice: double.parse(products[index].price).toInt(),
            isAvailable: products[index].isAvailable)));
    _isLoading = false;
    update();
  }
}
