import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:price_runner/core/dependecies.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(DevicePreview(builder: (context) => const MyApp()));
}
