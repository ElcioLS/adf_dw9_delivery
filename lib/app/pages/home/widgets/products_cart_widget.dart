import 'package:adf_dw9_delivery/app/core/extensions/formatter_extension.dart';
import 'package:adf_dw9_delivery/app/core/ui/helpers/size_extensions.dart';
import 'package:adf_dw9_delivery/app/core/ui/styles/text_styles.dart';
import 'package:adf_dw9_delivery/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsCartWidget extends StatelessWidget {
  final List<OrderProductDto> cart;

  const ProductsCartWidget({
    super.key,
    required this.cart,
  });

  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    // sp.clear(); // // Esse comando limpa a autenticação no SharedPrefence
    if (!sp.containsKey('accessToken')) {
      //Envio para o Login
      final loginResult = await navigator.pushNamed('/auth/login');

      if (loginResult == null || loginResult == false) {
        return;
      }
    }
    //Envio para o Order
    // Navigator.of(context).pushNamed('/order'); //Não posso usar o Navigator.of aqui por te usado await dentro de uma StatelessWidget. Devo criar uma variável como acima
    await navigator.pushNamed('/order', arguments: cart);
  }

  @override
  Widget build(BuildContext context) {
    var totalCart = cart
        .fold<double>(
          0.0,
          (total, element) => total += element.totalPrice,
        )
        .currencyPTBR;

    return Container(
      width: context.screenWidth,
      height: 90,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Ver Sacola',
                style: context.textStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalCart,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}
