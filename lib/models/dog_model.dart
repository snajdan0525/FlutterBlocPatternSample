// To parse this JSON data, do
//
//     final dog = dogFromJson(jsonString);

import 'dart:convert';

Dog dogFromJson(String str) => Dog.fromJson(json.decode(str));

String dogToJson(Dog data) => json.encode(data.toJson());

class Dog {
    String status;
    String message;

    Dog({
        this.status,
        this.message,
    });

    factory Dog.fromJson(Map<String, dynamic> json) => new Dog(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}