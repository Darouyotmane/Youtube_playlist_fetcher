import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.error_outline),
          Text('Quelque chose ne va pas, réessayer plus tard')
        ],
      ),
    );
  }
}
