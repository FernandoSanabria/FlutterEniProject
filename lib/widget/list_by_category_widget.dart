import 'package:flutter/material.dart';
import 'package:neiproject2021/page/detail_product_page.dart';

class ListByCategory extends StatefulWidget {
  ListByCategory({this.category});
  final String category;

  @override
  _ListByCategoryState createState() => _ListByCategoryState();
}

class _ListByCategoryState extends State<ListByCategory> {
  final dommieList = List<String>.generate(30, (index) => "Tela ${index + 1} ");


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.separated(
      itemCount: dommieList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailProduct()));
        },
        leading: Container(
          height: size.width * 0.2,
          width: size.width * 0.2,
          child: Card(
            child: 
            ClipRRect(
    borderRadius:BorderRadius.circular(10),
     child: index ==2 ? FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://i.pinimg.com/originals/7d/92/47/7d92471566ee921b82c9946569ffc614.jpg'),
       fit: BoxFit.fill,
       ): index ==4?  FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://www.logycom.mx/blog/wp-content/uploads/2018/08/industria-textil-mexico.png'),
       fit: BoxFit.fill,
       ): index.isEven && index!=2 ?  FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://img.culturacolectiva.com/cdn-cgi/image/f=auto,w=1600,q=80,fit=contain/featured_image/2018/02/07/1518043469273/portada.jpg'),
       fit: BoxFit.fill,
       ): index.isOdd ?  FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://media.fabfab.net/images/products/popup/tela-de-jersey-de-viscosa-flores-asiaticas-negro-rojo-muestra--81_poso_e20_050_SZ00.jpg'),
       fit: BoxFit.fill,
       ):FadeInImage(
       placeholder: AssetImage('lib/assets/Spinner.gif'), 
       image: NetworkImage('https://cdnes.tiendas.com/images/KQpEHUq1JqnGVKMtAE9vPSN9JWMpwfpCGZhM6Djcd58lPi2NHvUsKk50REnB6S0OEAVV2FsFuyBe3odix%2Fm7yA%3D%3D.jpg?w=300&h=300&trim=1'),
       fit: BoxFit.fill,
       ),
   ),
            // FlutterLogo(
            //   textColor: Colors.brown,
            //   style: FlutterLogoStyle.stacked,
            // ),
          ),
        ),
        title: Text(dommieList[index] + widget.category),
        subtitle: Text("Tela suave  ${dommieList[index]}"),
        trailing: Icon(Icons.more_vert),
      ),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
