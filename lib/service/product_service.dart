import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:neiproject2021/model/general_response.dart';
import 'package:neiproject2021/model/product_model.dart';

class ProductService {
  final url = "https://10.0.2.2:44391/api/product";
  Future<GeneralResponse> Add(Product product) async {


    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
         
        "code": product.code,
        "composition": product.composition,
        "description": product.description,
        "tissue": product.tissue,
        "use": product.use,
        "waterRepelence": product.waterRepelence,
        "basePrice": product.basePrice,
        "idCategory": product.idCategory,
        "name": product.name,
        }),
      );

      Map<String, dynamic> resDecode = json.decode(response.body);

      print(resDecode);

      GeneralResponse generalResponse = GeneralResponse();



      generalResponse.successful= resDecode['successful'];
      generalResponse.message = resDecode['message'];



      return generalResponse;

    } catch (e) {
      return(e);
    }
  }


  Future <List<Product>> getByCategory(int idCategory) async{

  }
}
