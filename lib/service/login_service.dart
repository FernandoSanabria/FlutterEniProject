import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:neiproject2021/model/auth_request_model.dart';
import 'package:neiproject2021/model/auth_response.dart';

class LoginService {
  final url = "https://10.0.2.2:44391/api/login";
  Future<AuthResponse> sendRequest(AuthRequest authRequest) async {


    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': authRequest.email,
          'password': authRequest.password,
        }),
      );

      Map<String, dynamic> resDecode = json.decode(response.body);

      print(resDecode);

      AuthResponse authResponse = AuthResponse();
      authResponse.id = resDecode['data']['id'];
      authResponse.name = resDecode['data']['name'];
      authResponse.usertype = resDecode['data']['usertype'];
      authResponse.token = resDecode['data']['token'];

      print(authResponse);

      return authResponse;

    } catch (e) {
      return(e);
    }
  }
}
