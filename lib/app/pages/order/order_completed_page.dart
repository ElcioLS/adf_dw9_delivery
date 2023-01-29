import 'package:adf_dw9_delivery/app/core/ui/helpers/size_extensions.dart';
import 'package:adf_dw9_delivery/app/core/ui/styles/text_styles.dart';
import 'package:adf_dw9_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.percentHeight(.2),
                ),
                Image.asset('assets/images/logo_rounded.png'),
                const SizedBox(height: 20),
                Text(
                  'Parabéns!\nVocê acabou de realizar seu pedido.\nEm breve receberá seu cupom fiscal.\nObrigado!',
                  textAlign: TextAlign.center,
                  style: context.textStyles.textExtraBold.copyWith(
                    fontSize: 18,
                    color: Colors.green.shade900,
                  ),
                ),
                const SizedBox(height: 40),
                DeliveryButton(
                  width: context.percentWidth(.8),
                  label: 'FECHAR',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
