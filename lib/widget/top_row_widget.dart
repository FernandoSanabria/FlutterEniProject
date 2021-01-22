import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var seize = MediaQuery.of(context).size;
    
        return Row(
          children: [
            Container(
                          padding: EdgeInsets.only(
                              top: seize.width * 0.04, left: seize.width * 0.02),
                      child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: seize.width * 0.10,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
          ],
        );
  }
}