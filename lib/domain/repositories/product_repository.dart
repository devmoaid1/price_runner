import 'package:price_runner/data/datasources/product_remote_data_source.dart';
import 'package:price_runner/data/models/product.dart';

abstract class ProductRepository {
  Future<Product> getDubaiStoreProduct();
  Future<Product> getJumiaProduct();
  Future<Product> getAmazonProduct();
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource productRemoteDatasource;

  ProductRepositoryImpl({required this.productRemoteDatasource});
  @override
  Future<Product> getAmazonProduct() async {
    final html = await productRemoteDatasource.getAmazonHtmlDocument();

    final String productPrice = html
        .querySelector(
            "#corePriceDisplay_desktop_feature_div > div.a-section.a-spacing-none.aok-align-center > span.a-price.aok-align-center.reinventPricePriceToPayMargin.priceToPay > span.a-offscreen")!
        .innerHtml
        .split("</span>")[1]
        .split(".")[0];

    final String stock = html.querySelector("#availability > span")!.innerHtml;

    final isAvailable =
        stock.startsWith("Only"); // only means there is a stock left

    final amazonProduct = Product(
        imagePath: "",
        name: "",
        storeName: "Amazon EG",
        price: productPrice,
        isAvailable: isAvailable);

    return amazonProduct;
  }

  @override
  Future<Product> getDubaiStoreProduct() async {
    final html = await productRemoteDatasource.getDubaiHtmlDocument();

    var imagePath = html
        .querySelector(
            '#o-carousel-product > div.d-none.d-md-block.text-center > ol > li.d-inline-block.m-1.align-top.active > div > img')!
        .attributes['src'];
    final String productTitle =
        html.querySelector('#product_details > h1')!.innerHtml;
    final String productPrice = html
        .querySelector(
            "#product_details > form > div > div.product_price.mt16 > h4.oe_price_h4.css_editable_mode_hidden > b > span")!
        .innerHtml;
    final String stock = html
        .querySelector(
            "#product_details > form > div > div.availability_messages.o_not_editable")!
        .firstChild!
        .children[0]
        .id;

    print("Dubai: $stock");

    final isAvailable = stock.endsWith("stock"); //means there is a stock left

    final dubaiProduct = Product(
        imagePath: imagePath.toString(),
        name: productTitle,
        storeName: "Dubai Phone",
        price: productPrice,
        isAvailable: isAvailable);

    return dubaiProduct;
  }

  @override
  Future<Product> getJumiaProduct() async {
    final html = await productRemoteDatasource.getJumiaHtmlDocument();

    final String productPrice = html
        .querySelector(
            "#jm > main > div:nth-child(2) > div.col4 > div > article > div > div > div > span")!
        .innerHtml
        .split(" ")[1];
    final String stock = html.querySelector("5 units left")!.outerHtml;

    final isAvailable = stock.endsWith("left"); //means there is a stock left

    final jumiaProduct = Product(
        imagePath: "",
        name: "",
        storeName: "Jumia Egypt",
        price: productPrice,
        isAvailable: isAvailable);

    return jumiaProduct;
  }
}
