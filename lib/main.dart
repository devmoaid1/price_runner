import 'package:flutter/material.dart';
import 'package:price_runner/core/dependecies.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}
