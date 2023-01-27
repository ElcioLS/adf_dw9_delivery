import 'package:adf_dw9_delivery/app/core/ui/theme/theme_config.dart';
import 'package:adf_dw9_delivery/app/pages/auth/login/login_page.dart';
import 'package:adf_dw9_delivery/app/pages/auth/register/register_router.dart';
import 'package:adf_dw9_delivery/app/pages/product_detail/product_detail_router.dart';
import 'package:flutter/material.dart';

import 'core/provider/application_binding.dart';
import 'pages/home/home_router.dart';
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
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => const LoginPage(),
          '/auth/register': (context) => RegisterRouter.page,
        },
      ),
    );
  }
}
