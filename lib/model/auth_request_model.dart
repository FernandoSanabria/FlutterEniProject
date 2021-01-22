
import 'dart:convert';

AuthRequest authRequestFromJson(String str) => AuthRequest.fromJson(json.decode(str));

String authRequestToJson(AuthRequest data) => json.encode(data.toJson());

class AuthRequest {
    AuthRequest({
        this.email,
        this.password,
    });

    String email;
    String password;

    factory AuthRequest.fromJson(Map<String, dynamic> json) => AuthRequest(
        email: json["Email"],
        password: json["Password"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
    };
}
