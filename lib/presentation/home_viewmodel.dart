import 'package:get/get.dart';
import 'package:price_runner/domain/repositories/product_repository.dart';

import '../data/models/product.dart';

class HomeViewModel extends GetxController {
  final ProductRepository productRepository;

  Product? _product;

  HomeViewModel({required this.productRepository});
  Product? get product => _product;

  Future<void> getProduct() async {}

  Future<void> getData() async {
    final p1 = await productRepository.getAmazonProduct();
    // final p2 = await productRepository.getDubaiStoreProduct();
    // final p3 = await productRepository.getJumiaProduct();

    print("Amazon: price: ${p1.price} =>  isAvailable:${p1.isAvailable}");
    // print("Dubai: ${p3.isAvailable}");
    // print("Jumia: $p3");

    // try {
    //   var response = await http.get(Uri.parse(AppConstants.dubaiPhone));

    //   if (response.statusCode == 200) {
    //     dom.Document html = dom.Document.html(response.body);
    //     final String productTitle =
    //         html.querySelector('#product_details > h1')!.innerHtml;
    //     var imagePath = html
    //         .querySelector(
    //             '#o-carousel-product > div.d-none.d-md-block.text-center > ol > li.d-inline-block.m-1.align-top.active > div > img')!
    //         .attributes['src'];
    //     print(imagePath);
    //   }
    // } catch (err) {
    //   print(err.toString());
    // }
  }
}
