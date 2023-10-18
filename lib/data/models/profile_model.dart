// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  String username;
  String name;
  int id;
  String phone;
  String email;
  String website;
  String adress;

  ProfileModel({
    required this.username,
    required this.name,
    required this.id,
    required this.phone,
    required this.email,
    required this.website,
    required this.adress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'name': name,
      'id': id,
      'phone': phone,
      'email': email,
      'website': website,
      'adress': adress,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      username: map['username'] as String,
      name: map['name'] as String,
      id: map['id'] as int,
      phone: map['phone'] as String,
      email: map['email'] as String,
      website: map['website'] as String,
      adress: map['adress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
