import 'package:flutter/material.dart';
class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [const Icon(Icons.error_outline),Text('')],);
  }
}
