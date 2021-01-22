import 'package:flutter/material.dart';


class TopShape extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var seize = MediaQuery.of(context).size;


    return Container(
              height: seize.height * 0.18,
              width: seize.width,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(seize.width * 0.10))),
            );
  }
}