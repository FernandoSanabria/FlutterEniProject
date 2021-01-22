import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
    AuthResponse({
        this.id,
        this.name,
        this.email,
        this.usertype,
        this.token,
    });

    int id;
    String name;
    String email;
    String usertype;
    String token;

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        usertype: json["usertype"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "usertype": usertype,
        "token": token,
    };
}
