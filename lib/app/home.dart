import 'package:adf_dw9_delivery/app/core/global/global_context.dart';
import 'package:adf_dw9_delivery/app/core/ui/theme/theme_config.dart';
import 'package:adf_dw9_delivery/app/pages/auth/login/login_router.dart';
import 'package:adf_dw9_delivery/app/pages/auth/register/register_router.dart';
import 'package:adf_dw9_delivery/app/pages/order/order_router.dart';
import 'package:adf_dw9_delivery/app/pages/product_detail/product_detail_router.dart';
import 'package:flutter/material.dart';

import 'core/provider/application_binding.dart';
import 'pages/home/home_router.dart';
import 'pages/order/order_completed_page.dart';
import 'pages/splash/splash_page.dart';

class Home extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  Home({super.key}) {
    GlobalContext.i.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        navigatorKey: _navKey,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => OrderRouter.page,
          '/order/completed': (context) => const OrderCompletedPage(),
        },
      ),
    );
  }
}
