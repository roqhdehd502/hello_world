import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FutureBuilderWidget(
              textStyle: textStyle,
              onPressed: () {
                setState(() {});
              },
              getFutureNumber: futureNumber(),
            ),
            SizedBox(height: 20.0),
            _StreamBuilderWidget(
              textStyle: textStyle,
              onPressed: () {
                setState(() {});
              },
              getStreamNumber: streamNumbers(),
            ),
          ],
        ),
      ),
    );
  }

  // 일정 시간 딜레이가 되는 동안 커넥션이 유지되고, 커넥션이 종료되면 데이터 반환
  Future<int> futureNumber() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();

    // throw Exception('에러가 발생했습니다.');

    return random.nextInt(100);
  }

  // 일정 시간동안 특정 데이터를 계속 받으며 커넥션이 유지되고, 원하는 횟수 및 데이터를 모두 받으면 커넥션 종료 (자동으로 dispose)
  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      if (1 == 5) {
        throw Exception('1 = 5');
      }

      await Future.delayed(Duration(seconds: 1));

      yield i;
    }
  }
}

class _FutureBuilderWidget extends StatelessWidget {
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final Future<int> getFutureNumber;

  const _FutureBuilderWidget({
    required this.textStyle,
    required this.onPressed,
    required this.getFutureNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('에러라네: ${snapshot.error}'),
          );
        }
        if (!snapshot.hasData) {
          // 데이터를 로딩 중 일때 위젯 렌더링
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // 데이터가 있을때 위젯 렌더링
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'FutureBuilder',
                style: textStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'ConState: ${snapshot.connectionState}',
                style: textStyle,
              ),
              Row(
                children: [
                  Text(
                    'Data: ${snapshot.data}',
                    style: textStyle,
                  ),
                ],
              ),
              Text(
                'Error: ${snapshot.error}',
                style: textStyle,
              ),
              ElevatedButton(
                onPressed: onPressed,
                child: Text('setState'),
              )
            ],
          );
        }
      },
      future: getFutureNumber,
    );
  }
}

class _StreamBuilderWidget extends StatelessWidget {
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final Stream<int> getStreamNumber;

  const _StreamBuilderWidget({
    required this.textStyle,
    required this.onPressed,
    required this.getStreamNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('에러라네: ${snapshot.error}'),
          );
        }
        if (!snapshot.hasData) {
          // 데이터를 로딩 중 일때 위젯 렌더링
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // 데이터가 있을때 위젯 렌더링
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'StreamBuilder',
                style: textStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'ConState: ${snapshot.connectionState}',
                style: textStyle,
              ),
              Row(
                children: [
                  Text(
                    'Data: ${snapshot.data}',
                    style: textStyle,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onPressed,
                child: Text('setState'),
              )
            ],
          );
        }
      },
      stream: getStreamNumber,
    );
  }
}
