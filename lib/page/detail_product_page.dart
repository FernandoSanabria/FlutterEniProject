import 'package:flutter/material.dart';
import 'package:neiproject2021/widget/custom_page_widget.dart';
import 'package:neiproject2021/widget/dots_indicator_widget.dart';
import 'package:neiproject2021/widget/top_row_widget.dart';
import 'package:neiproject2021/widget/top_shape_widget.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seize = MediaQuery.of(context).size;
    final _controller = PageController(
      initialPage: 1,
    );
    const _kDuration = Duration(milliseconds: 400);
    const _kCurve = Curves.ease;

    final List<Widget> _screens = [
      ClipRRect(
    borderRadius:BorderRadius.circular(10),
     child: FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://revistaaxxis.com.co/wp-content/uploads/2015/01/especial-telas-y-tapetes-revista-axxis-1.jpg'),
       fit: BoxFit.fill,
       ),
   ),

     ClipRRect(
    borderRadius:BorderRadius.circular(10),
     child: FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://media.fabfab.net/images/products/popup/tela-de-jersey-de-viscosa-flores-asiaticas-negro-rojo-muestra--81_poso_e20_050_SZ00.jpg'),
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
        ),
      );
    }

    Widget _carrousel() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: seize.width * 0.15),
          height: seize.height * 0.35,
          width: seize.width * 0.90,
          child: PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemCount: _screens.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildPageItem(context, index % _screens.length),
          ),
        ),
      );
    }

    Widget _topPage() {
      return Stack(
        children: [TopShape(), TopRow(), _carrousel(), _positionedDots()],
      );
    }

    Widget _firstRowDetail() {
      return ListTile(
        title: Text(
          ' Tela Ajieres',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
        ),
        subtitle: Text('  Categoría: Tapetes'),
      );
    }

    Widget _secondRowDetail() {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: seize.width * .05, top: seize.width * .025),
            alignment: Alignment.topLeft,
            child: Text(
              'Descripción',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: seize.width * .05, top: seize.width * .025),
            alignment: Alignment.topLeft,
            child: Text(
                'Con apariencia de seda sintética. De gran resistencia, sensible al calor, por tanto debemos tener cuidado al plancharla, aunque no suele arrugarse con facilidad. Se caracteriza por su brillo, no destiñe ni se encoge. El acetato suele usarse en prendas como vestidos, blusas, punto y lencería'),
          )
        ],
      );
    }

    Widget _thirdRowDetail() {
      return Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: seize.width * .05, top: seize.width * .025),
            child: Text(
              'Características',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: seize.width * .05, top: seize.width * .025),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'Código',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      'Composición',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      'Tejido',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: seize.width * .05, top: seize.width * .025),
            child: Row(
              children: [
                Expanded(
                  child: Text('9876545'),
                  flex: 1,
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      'Poliester',
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      'Plano',
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: seize.width * .05, top: seize.width * .035),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'Uso',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      'Repelencia al agua',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      'Precio base',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: seize.width * .05, top: seize.width * .025),
            child: Row(
              children: [
                Expanded(
                  child: Text('Trafico pesado'),
                  flex: 1,
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      '99% AHGT',
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      '\$90.000 M2',
                    )),
              ],
            ),
          ),
        ],
      );
    }

    Widget _buttons() {
      return Container(
        width: seize.width,
        height: seize.width * 0.15,
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: seize.width * .02, top: seize.width * .06),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50.0,
                  width: seize.width * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        colors: [Color(0xFF81E542), Color(0xFF408D10)],
                        begin: FractionalOffset(0.2, 0.0),
                        end: FractionalOffset(1.0, 0.6),
                        stops: [0.0, 0.6],
                        tileMode: TileMode.clamp),
                  ),
                  child: Center(
                      child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: seize.width * .1),
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          )),
                      Text(
                        ' Editar',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Alata',
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: seize.width * .163, top: seize.width * .06),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50.0,
                  width: seize.width * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        colors: [Color(0xFFC81A0B), Color(0xFFFB5547)],
                        begin: FractionalOffset(0.2, 0.0),
                        end: FractionalOffset(1.0, 0.6),
                        stops: [0.0, 0.6],
                        tileMode: TileMode.clamp),
                  ),
                  child: Center(
                      child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: seize.width * .1),
                          child: Icon(
                            Icons.delete_outlined,
                            color: Colors.white,
                          )),
                      Text(
                        ' Eliminar',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Alata',
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _bottomPage() {
      return Container(
        padding: EdgeInsets.only(top: seize.width * .025),
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            _firstRowDetail(),
            Divider(),
            _secondRowDetail(),
            Divider(),
            _thirdRowDetail(),
            _buttons()
          ],
        ),
      );
    }

    return Scaffold(
        body: Column(
      children: [Flexible(flex: 4, child: _topPage()), Flexible( flex: 7, child: _bottomPage())],
    ));
  }
}
