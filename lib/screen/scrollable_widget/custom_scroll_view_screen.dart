import 'package:flutter/material.dart';
import 'package:hello_world/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('CustomScrollViewScreen'),
          ),
          // SliverList
          //renderSliverChildBuilderDelegate(),
          // SliverGrid
          renderSliverGridSliverChildBuilderDelegate(),
        ],
      ),
    );
  }

  // SliverChildListDelegate를 이용한 기본적인 SliverList
  SliverList renderSliverListSliverChildListDelegate() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  // SliverChildBuilderDelegate를 이용한 SliverList 최적화
  SliverList renderSliverListSliverChildBuilderDelegate() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: numbers.length,
      ),
    );
  }

  // SliverChildListDelegate를 이용한 기본적인 SliverGrid
  SliverGrid renderSliverGridSliverChildListDelegate() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  // SliverChildBuilderDelegate를 이용한 SliverGrid 최적화
  SliverGrid renderSliverGridSliverChildBuilderDelegate() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: numbers.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      key: Key(index.toString()),
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
