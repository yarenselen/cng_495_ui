// profile info model is used to store user information in the database and get user information from the dynamoDB database

import 'package:equatable/equatable.dart';

class ProfileInfoModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? age;

  const ProfileInfoModel({
    required this.name,
    required this.email,
    required this.password,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.age,
  });

  @override
  List<Object> get props => [name, email, password];

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return ProfileInfoModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'age': age,
    };
  }

  ProfileInfoModel copyWith({
    String? name,
    String? email,
    String? password,
    String? id,
    String? createdAt,
    String? updatedAt,
    String? age,
  }) {
    return ProfileInfoModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      age: age ?? this.age,
    );
  }

  @override
  String toString() {
    return 'ProfileInfoModel(name: $name, email: $email, password: $password, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileInfoModel &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.age == age;
  }

  factory ProfileInfoModel.fromMap(Map<String, dynamic> map) {
    return ProfileInfoModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      id: map['id'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      age: map['age'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'age': age,
    };
  }

  // connect to dynamoDB database and get user information from the database by email
  factory ProfileInfoModel.fromDynamoDB(Map<String, dynamic> map) {
    // get user information from the database by email
    // TODO: implement fromDynamoDB
    return ProfileInfoModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      id: map['id'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      age: map['age'],
    );
  }
}
