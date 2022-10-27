class PriceModel {
  final String storeImagePath;
  final String storeName;
  final int productPrice;
  final bool isAvailable;

  PriceModel(
      {required this.storeImagePath,
      required this.storeName,
      required this.productPrice,
      required this.isAvailable});
}
