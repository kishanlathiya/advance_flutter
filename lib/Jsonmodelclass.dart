import 'package:flutter/material.dart';

class Detail {
  final String image;
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final int age;
  final String phoneNumber;
  final String emailId;
  final String city;
  final String state;
  final String country;
  var code;

  Detail({
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.country,
    required this.age,
    required this.city,
    required this.gender,
    required this.emailId,
    required this.phoneNumber,
    required this.state,
    required this.code,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      image: json["results"][0]["picture"]["large"],
      firstName: json["results"][0]["name"]["first"],
      country: json["results"][0]["location"]["country"],
      lastName: json["results"][0]["name"]["last"],
      city: json["results"][0]["location"]["city"],
      age: json["results"][0]["dob"]["age"],
      code: json["results"][0]["location"]["postcode"],
      gender: json["results"][0]["gender"],
      phoneNumber: json["results"][0]["phone"],
      dob: json["results"][0]["dob"]["date"],
      emailId: json["results"][0]["email"],
      state: json["results"][0]["location"]["state"],
    );
  }
}
