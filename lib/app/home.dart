import 'package:adf_dw9_delivery/app/core/ui/theme/theme_config.dart';
import 'package:flutter/material.dart';

import 'core/provider/application_binding.dart';
import 'pages/splash/splash_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
        },
      ),
    );
  }
}
