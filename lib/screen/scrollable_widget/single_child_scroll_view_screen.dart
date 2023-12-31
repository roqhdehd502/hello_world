import 'package:flutter/material.dart';
import 'package:hello_world/component/render_container.dart';
import 'package:hello_world/const/colors.dart';
import 'package:hello_world/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollViewScreen',
      body: renderSingleScrollViewCaseOne(),
    );
  }

  // 기본 SingleScrollView 렌더링
  SingleChildScrollView renderSingleScrollViewCaseOne() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map(
              (e) => RenderContainer(
                  color: rainbowColors[e % rainbowColors.length], index: e),
            )
            .toList(),
      ),
    );
  }

  // physics의 옵션을 이용하여 스크롤 유무 설정 가능한 SingleScrollView 렌더링
  SingleChildScrollView renderSingleScrollViewCaseTwo() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics: 스크롤 불가
      // AlwaysScrollableScrollPhysics: 항상 스크롤 가능하게
      // BouncingScrollPhysics: 바운스 되는 애니메이션을 적용한 스크롤 적용 (IOS 스타일)
      // ClampingScrollPhysics: 걸치는 듯한 애니메이션을 적용한 스크롤 적용 (Android 스타일)
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          RenderContainer(
            color: Colors.black,
            index: 0,
          ),
        ],
      ),
    );
  }

  // clipBehavior 옵션을 이용하여 스크롤을 해도 위젯 잘림 유무 설정
  SingleChildScrollView renderSingleScrollViewCaseThree() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          RenderContainer(
            color: Colors.black,
            index: 0,
          ),
        ],
      ),
    );
  }

  // 주의! 다량의 데이터를 렌더링 할 때에는 퍼포먼스를 이유로 ListView를 이용한다
  SingleChildScrollView renderSingleScrollViewCaseFour() {
    return SingleChildScrollView(
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
    );
  }
}
