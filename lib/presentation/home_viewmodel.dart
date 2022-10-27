import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_runner/data/models/price_model.dart';
import 'package:price_runner/domain/repositories/product_repository.dart';

import '../core/utils/show_custom_snackbar.dart';
import '../data/models/product.dart';

class HomeViewModel extends GetxController {
  final ProductRepository productRepository;

  Product? _product;

  bool _isLoading = true;

  bool _isShowAll = true;

  bool get isShowAll => _isShowAll;

  bool get isLoading => _isLoading;

  List<PriceModel> _prices = [];

  List<PriceModel> _currentPrices = [];

  List<PriceModel> get prices => _prices;
  List<PriceModel> get currentPrices => _currentPrices;

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

    // if sucess add to list if failure skip adding to list
    amazonProduct.fold(
        (failure) => showCustomSnackBar(
              color: Colors.red,
              message: failure.message,
            ),
        (product) => products.add(product));

    dubaiProduct.fold(
        (failure) =>
            showCustomSnackBar(color: Colors.red, message: failure.message),
        (product) => products.add(product));

    jumiaProduct.fold(
        (failure) =>
            showCustomSnackBar(color: Colors.red, message: failure.message),
        (product) => products.add(product));

    return products;
  }

  Future<void> getProductDetails() async {
    final products = await _getProductFromAllStores();

    if (products.isNotEmpty) {
      _product = products
          .where((element) => element.name.isNotEmpty)
          .toList()[0]; //get product that contains prodct name

      _prices = List.generate(
          products.length,
          ((index) => PriceModel(
              storeImagePath: '',
              storeName: products[index].storeName,
              productPrice: double.parse(products[index].price).toInt(),
              isAvailable: products[index].isAvailable)));

      _prices.sort(((a, b) => a.productPrice
          .compareTo(b.productPrice))); // sort lest decending by product price
      _currentPrices = List.from(_prices);
      _currentPrices
          .removeLast(); // current prices contains all prices without the most expensive

      _isLoading = false;
    }

    update();
  }

  void setShowAll() {
    _isShowAll = false;
    _currentPrices = List.from(_prices);
    update();
  }

  void setShowLess() {
    _isShowAll = true;
    _currentPrices.removeLast();
    update();
  }
}
