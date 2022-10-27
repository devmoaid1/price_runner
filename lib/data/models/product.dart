class Product {
  final String name;
  final String storeName;
  final String price;
  final String imagePath;
  final bool isAvailable;

  Product(
      {required this.name,
      required this.imagePath,
      required this.storeName,
      required this.price,
      required this.isAvailable});
}
