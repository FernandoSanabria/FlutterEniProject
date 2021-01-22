import 'package:flutter/material.dart';


class CustomTabs extends StatelessWidget {
  const CustomTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;

    return SizedBox(
              height: 60,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                bottom: TabBar(
                  unselectedLabelColor: Colors.grey[400],
                  indicatorColor: Colors.red[300],
                  labelColor: Colors.red[200],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                  
                      UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: Colors.red[300], width: size.width * 0.01),
                          insets: EdgeInsets.all(5.0)),
                  indicatorWeight: 3.0,
                  isScrollable: true,
                  tabs: 
                  [
                    Tab(
                      text: 'Telas chinas',
                    ),
                    Tab(
                      text: 'Telas asiaticas',
                    ),
                    Tab(
                      text: 'Telas nacionales',
                    ),
                    Tab(
                      text: 'Telas europeas',
                    )
                  ],
                ),
              ),
            );
  }
}