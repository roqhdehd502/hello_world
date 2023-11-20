import 'package:flutter/material.dart';

class RenderContainer extends StatelessWidget {
  final Color color;
  final int index;
  final double? height;

  const RenderContainer({
    required this.color,
    required this.index,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(index);
    return Container(
      key: Key(index.toString()),
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
