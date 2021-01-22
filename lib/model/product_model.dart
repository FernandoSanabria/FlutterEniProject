import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.id,
        this.code,
        this.composition,
        this.description,
        this.tissue,
        this.use,
        this.waterRepelence,
        this.basePrice,
        this.idCategory,
        this.name,
        this.images,
    });

    int id;
    String code;
    String composition;
    dynamic description;
    String tissue;
    String use;
    String waterRepelence;
    int basePrice;
    int idCategory;
    String name;
    List<Image> images;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        code: json["code"],
        composition: json["composition"],
        description: json["description"],
        tissue: json["tissue"],
        use: json["use"],
        waterRepelence: json["waterRepelence"],
        basePrice: json["basePrice"],
        idCategory: json["idCategory"],
        name: json["name"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "composition": composition,
        "description": description,
        "tissue": tissue,
        "use": use,
        "waterRepelence": waterRepelence,
        "basePrice": basePrice,
        "idCategory": idCategory,
        "name": name,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}

class Image {
    Image({
        this.id,
        this.idProduct,
        this.urlImage,
    });

    int id;
    int idProduct;
    String urlImage;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        idProduct: json["idProduct"],
        urlImage: json["urlImage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idProduct": idProduct,
        "urlImage": urlImage,
    };
}