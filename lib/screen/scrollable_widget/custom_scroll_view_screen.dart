import 'package:flutter/material.dart';
import 'package:hello_world/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            renderSliverAppbar(),
            renderHeader(),
            // SliverList
            renderSliverListSliverChildBuilderDelegate(),
            renderHeader(),
            // SliverGrid
            renderSliverGridSliverChildBuilderDelegate(),
          ],
        ),
      ),
    );
  }

  // SliverAppbar
  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
      pinned: false, // Appbar 완전 고정
      floating: true, // 스크롤 할 때 Appbar 표시
      snap: true, // Appbar 자석 효과 (floating이 true일 때만 가능)
      stretch: true, // 한계 지점이상 스크롤을 핧 때, Appbar의 사이즈가 늘어져서 표시
      expandedHeight: 200, // 스크롤 할 때 표시되는 Appbar의 높이
      collapsedHeight: 150, // 스크롤 할 숨겨지는 Appbar의 높이
      flexibleSpace: FlexibleSpaceBar(
        // 스크롤 할 때만 표시되는 AppBar 공간
        title: Text('Flex'),
      ),
      title: Text('CustomScrollViewScreen'),
    );
  }

  // SliverPersistentHeader
  SliverPersistentHeader renderHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.white,
          child: Center(child: Text('요잉크')),
        ),
        maxHeight: 150.0,
        minHeight: 75.0,
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

// 별도의 Header를 pin하거나 float를 하는 위젯
class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  // shouldRebuild: build를 새로할지 여부 결정
  // oldDelegate: build가 실행이 됐을때 이전 delegate
  // this: 새로운 delegate
  @override
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
