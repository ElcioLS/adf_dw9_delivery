import 'package:adf_dw9_delivery/app/core/ui/widgets/delivery_appbar.dart';
import 'package:adf_dw9_delivery/app/models/product_model.dart';
import 'package:adf_dw9_delivery/app/pages/splash/home/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProductTile(
                  product: ProductModel(
                    id: 0,
                    name: 'Lanche x',
                    description:
                        'Lanche acompanha pão francês, contra filé, alface, vinagrete, queijo e maionese',
                    price: 15.0,
                    image:
                        'https://burgerx.com.br/assets/img/galeria/burgers/x-burger.jpg',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
