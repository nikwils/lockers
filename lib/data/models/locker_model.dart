// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LockerModel {
  int id;
  String code;
  String title;
  bool isLock;

  LockerModel({
    required this.id,
    required this.code,
    required this.title,
    required this.isLock,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'title': title,
      'is_lock': isLock,
    };
  }

  factory LockerModel.fromMap(Map<String, dynamic> map) {
    return LockerModel(
      id: map['id'] as int,
      code: map['code'] as String,
      title: map['title'] as String,
      isLock: map['is_lock'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LockerModel.fromJson(String source) =>
      LockerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
