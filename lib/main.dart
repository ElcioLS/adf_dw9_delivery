import 'package:flutter/material.dart';

import 'app/core/config/env/env.dart';
import 'app/home.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(Home());
}
