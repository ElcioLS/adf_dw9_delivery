import 'package:adf_dw9_delivery/app/core/extensions/formatter_extension.dart';
import 'package:adf_dw9_delivery/app/core/ui/styles/colors_app.dart';
import 'package:adf_dw9_delivery/app/core/ui/styles/text_styles.dart';
import 'package:adf_dw9_delivery/app/core/ui/widgets/delivery_incre_decre_button.dart';
import 'package:adf_dw9_delivery/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTile({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    var product = orderProduct.product;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.network(
            product.image,
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style:
                        context.textStyles.textRegular.copyWith(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (orderProduct.amount * product.price).currencyPTBR,
                        style: context.textStyles.textMedium.copyWith(
                            fontSize: 14, color: context.colors.secondary),
                      ),
                      DeliveryIncreDecreButton.compact(
                        amount: 1,
                        incrementTap: () {},
                        decrementTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
