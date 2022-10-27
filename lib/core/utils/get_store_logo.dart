import 'package:price_runner/core/constants/app_constats.dart';
import 'package:price_runner/data/models/price_model.dart';

import '../constants/assets.dart';

String getStoreLogo(PriceModel priceModel) {
  switch (priceModel.storeName) {
    case AppConstants.amazonStore:
      return Assets.amazonLogo;
    case AppConstants.jumiaStore:
      return Assets.jumiaLogo;
    case AppConstants.dubaiStore:
      return Assets.dubaiLogo;
    default:
      return "";
  }
}
