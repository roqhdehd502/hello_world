import 'package:flutter/material.dart';
import 'package:hello_world/component/render_container.dart';
import 'package:hello_world/const/colors.dart';
import 'package:hello_world/layout/main_layout.dart';

class ScrollbarScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ScrollbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ScrollbarScreen',
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: numbers
                .map(
                  (e) => RenderContainer(
                    color: rainbowColors[e % rainbowColors.length],
                    index: e,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
