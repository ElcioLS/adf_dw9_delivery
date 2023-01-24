import 'package:adf_dw9_delivery/app/core/config/env/env.dart';
import 'package:adf_dw9_delivery/app/core/ui/helpers/size_extensions.dart';
import 'package:adf_dw9_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            width: 200,
            height: 200,
            label: Env.instance['backend_base_url'] ?? '',
            onPressed: () {},
          ),
          Text(context.screenWidth.toString()),
          Text(context.screenHeight.toString()),
          Row(
            children: [
              Container(
                color: Colors.red,
                width: context.percentWidth(.5),
                height: 50,
              ),
              Container(
                color: Colors.green,
                width: context.percentWidth(.5),
                height: 50,
              ),
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'text'),
          ),
        ],
      ),
    );
  }
}
