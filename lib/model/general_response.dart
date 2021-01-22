import 'dart:convert';

GeneralResponse generalResponseFromJson(String str) => GeneralResponse.fromJson(json.decode(str));

String generalResponseToJson(GeneralResponse data) => json.encode(data.toJson());

class GeneralResponse {
    GeneralResponse({
        this.successful,
        this.message,
        this.data,
    });

    bool successful;
    dynamic message;
    Data data;

    factory GeneralResponse.fromJson(Map<String, dynamic> json) => GeneralResponse(
        successful: json["successful"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "successful": successful,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data();

    factory Data.fromJson(Map<String, dynamic> json) => Data(
    );

    Map<String, dynamic> toJson() => {
    };
}
