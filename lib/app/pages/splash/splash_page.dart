import 'package:adf_dw9_delivery/app/core/config/env/env.dart';
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'text'),
          ),
        ],
      ),
    );
  }
}
