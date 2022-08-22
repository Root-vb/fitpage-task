import 'dart:async';

import 'package:flutter/material.dart';
import 'package:starter/app/app.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const App());
  }, (error, stack) {});
}
