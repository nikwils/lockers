// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lockers/data/models/comment_model.dart';
import 'package:lockers/data/models/locker_model.dart';
import 'package:lockers/data/models/post_model.dart';
import 'package:lockers/data/models/profile_model.dart';

class GeneralModel {
  List<ProfileModel> profile;
  List<PostModel> posts;
  List<CommentModel> comments;
  List<LockerModel> lockers;

  GeneralModel({
    required this.profile,
    required this.posts,
    required this.comments,
    required this.lockers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'profile': profile.map((x) => x.toMap()).toList(),
      'posts': posts.map((x) => x.toMap()).toList(),
      'comments': comments.map((x) => x.toMap()).toList(),
      'lockers': lockers.map((x) => x.toMap()).toList(),
    };
  }

  factory GeneralModel.fromMap(Map<String, dynamic> map) {
    return GeneralModel(
      profile: List<ProfileModel>.from(
        (map['profile'] as List<dynamic>).map<ProfileModel>(
          (x) => ProfileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      posts: List<PostModel>.from(
        (map['posts'] as List<dynamic>).map<PostModel>(
          (x) => PostModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      comments: List<CommentModel>.from(
        (map['comments'] as List<dynamic>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      lockers: List<LockerModel>.from(
        (map['lockers'] as List<dynamic>).map<LockerModel>(
          (x) => LockerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralModel.fromJson(String source) =>
      GeneralModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
