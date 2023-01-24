import 'package:adf_dw9_delivery/app/pages/splash/home/home_page.dart';
import 'package:adf_dw9_delivery/app/repositories/products/products_repository.dart';
import 'package:adf_dw9_delivery/app/repositories/products/products_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(
              dio: context.read(),
            ),
          ),
        ],
        child: const HomePage(),
      );
}
