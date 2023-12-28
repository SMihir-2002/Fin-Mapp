import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const SizedBox(width: 20,),
        Text(data, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
      ],
    );
  }
}
