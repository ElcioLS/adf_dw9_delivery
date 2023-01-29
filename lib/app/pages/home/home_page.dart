import 'package:adf_dw9_delivery/app/core/ui/widgets/delivery_appbar.dart';
import 'package:adf_dw9_delivery/app/pages/home/widgets/products_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_state.dart';
import 'home_controller.dart';
import 'home_state.dart';
import 'widgets/product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    // SharedPreferences.getInstance().then((value) => value.clear());  //Usar pra deslogar Forçar!!!
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro mão informado');
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Text(
                state.productsCart.length.toString(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    final orders = state.productsCart
                        .where((order) => order.product == product);
                    return ProductTile(
                      product: product,
                      orderProduct: orders.isNotEmpty ? orders.first : null,
                    );
                  },
                ),
              ),
              Visibility(
                visible: state.productsCart.isNotEmpty,
                child: ProductsCartWidget(
                  cart: state.productsCart,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
