import 'package:adf_dw9_delivery/app/core/ui/helpers/size_extensions.dart';
import 'package:adf_dw9_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColoredBox(
      color: const Color(0xFF140E0E),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: context.screenWidth,
              child: Image.asset(
                'assets/images/lanche.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(context.screenHeight.toString(),
                    style: const TextStyle(color: Colors.white)),
                SizedBox(
                  height: context.screenHeight < 593.0
                      ? context.percentHeight(.10)
                      : context.percentHeight(.30),
                ),
                Image.asset(
                  'assets/images/logo.png',
                ),
                SizedBox(
                  height: context.screenHeight < 593.0
                      ? context.percentHeight(.10)
                      : context.percentHeight(.30),
                ),
                DeliveryButton(
                  label: 'ACESSAR',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
