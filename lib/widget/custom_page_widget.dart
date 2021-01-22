import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final page;
  final idx;

  CustomPage({@required this.page, @required this.idx});

  onTap() {
    print("${this.idx} selected");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: this.page,
      ),
    );
  }
}