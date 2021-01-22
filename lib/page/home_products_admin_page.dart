import 'package:flutter/material.dart';
import 'package:neiproject2021/widget/custom_app_bar_widget.dart';
import 'package:neiproject2021/widget/custom_page_widget.dart';
import 'package:neiproject2021/widget/customs_tabs_widget.dart';
import 'package:neiproject2021/widget/dots_indicator_widget.dart';
import 'package:neiproject2021/widget/custom_tab_bar_view_widget.dart';

class HomeProductsAdmin extends StatefulWidget {
  @override
  _HomeProductsAdminState createState() => _HomeProductsAdminState();
}

class _HomeProductsAdminState extends State<HomeProductsAdmin> {
  final _controller = PageController(
    initialPage: 1,
  );
  static const _kDuration = Duration(milliseconds: 400);
  static const _kCurve = Curves.ease;

  final List<Widget> _screens = [

    
   ClipRRect(
    borderRadius:BorderRadius.circular(10),
     child: FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://cdnes.tiendas.com/images/KQpEHUq1JqnGVKMtAE9vPSN9JWMpwfpCGZhM6Djcd58lPi2NHvUsKk50REnB6S0OEAVV2FsFuyBe3odix%2Fm7yA%3D%3D.jpg?w=300&h=300&trim=1'),
       fit: BoxFit.fill,
       ),
   ),

     ClipRRect(
    borderRadius:BorderRadius.circular(10),
     child: FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://thumbs.dreamstime.com/b/telas-persas-78040274.jpg'),
       fit: BoxFit.fill,
       ),
   ),

   ClipRRect(
    borderRadius:BorderRadius.circular(10),
     child: FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://i.pinimg.com/originals/7d/92/47/7d92471566ee921b82c9946569ffc614.jpg'),
       fit: BoxFit.fill,
       ),
   ),
  ];

  Widget _buildPageItem(BuildContext context, int index) {
    return CustomPage(page: _screens[index], idx: index);
  }

  Widget _positionedDots() {
    return Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          color: Colors.grey[50].withOpacity(0),
          padding: EdgeInsets.all(20.0),
          child: DotsIndicator(
            controller: _controller,
            itemCount: _screens.length,
            onPageSelected: (int indexPage) {
              _controller.animateToPage(indexPage,
                  duration: _kDuration, curve: _kCurve);
            },
            context: context,
          ),
        ));
  }

  Widget _carrousel() {
    return Container(
      child: PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _controller,
        itemCount: _screens.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildPageItem(context, index % _screens.length),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget _topPage() {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        height: size.height * 0.25,
        width: size.width * 0.9,
        child: Stack(
          children: [_carrousel(), _positionedDots()],
        ),
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            Flexible(flex: 1, child: _topPage()),
            CustomTabs(),
            SizedBox(
              height: 10,
            ),
            Flexible(flex: 2, child: MyCustomTabBarView()),
          ],
        ),
      ),
    );
  }
}
