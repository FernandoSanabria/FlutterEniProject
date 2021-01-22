import 'package:flutter/material.dart';
import 'package:neiproject2021/widget/list_by_category_widget.dart';



class MyCustomTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ListByCategory(
          category: 'chinas',
        ),
        ListByCategory(
          category: 'asiaticas',
        ),
        ListByCategory(
          category: 'nacionales',
        ),
        ListByCategory(
          category: 'europeas',
        ),
      ],
    );
  }
}