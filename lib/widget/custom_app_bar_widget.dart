import 'package:flutter/material.dart';
import 'package:neiproject2021/page/add_product_page.dart';
import 'package:neiproject2021/widget/search_widget.dart';


class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const CustomAppBar({Key key}) : super(key: key);

  @override
  PreferredSizeWidget  build(BuildContext context) {

    return AppBar(
          // centerTitle: true,
          title: Text(
            'Product Management',
            style: TextStyle(
                color: Colors.redAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                onPressed: () {
                  showSearch(
                      context: context, delegate: Search());
                }),
            IconButton(
              icon: Icon(Icons.add, color: Colors.grey,),
              onPressed: 
              (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct(),));
              },
            )
          ],
        );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(50);
  }
}