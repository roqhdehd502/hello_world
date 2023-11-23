import 'package:flutter/material.dart';
import 'package:hello_world/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BasicAppbarTabbarScreen'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: TabBar(
              indicatorColor: Colors.red,
              indicatorWeight: 4.0,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.w900),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w100),
              tabs: TABS
                  .map(
                    (e) => Tab(
                      icon: Icon(e.icon),
                      child: Text(e.label),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: TABS
              .map(
                (e) => Center(
                  child: Icon(e.icon),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
