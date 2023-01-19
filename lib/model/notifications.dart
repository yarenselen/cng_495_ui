// Notifications model is used to get notifications from the dynamoDB database.
// It has a struct of the notifications table in the database.

import 'package:equatable/equatable.dart';

class NotificationsModel extends Equatable {
  final String id;
  final String createdAt;
  final String title;
  final String description;
  final String type;
  final String userId;

  const NotificationsModel({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.type,
    required this.userId,
  });

  @override
  List<Object> get props => [id, createdAt, title, description, type, userId];

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id'],
      createdAt: json['createdAt'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'title': title,
      'description': description,
      'type': type,
      'userId': userId,
    };
  }

  // fromMap is used to convert map to NotificationsModel object
  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      id: map['id'],
      createdAt: map['createdAt'],
      title: map['title'],
      description: map['description'],
      type: map['type'],
      userId: map['userId'],
    );
  }

  // toMap is used to convert NotificationsModel object to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt,
      'title': title,
      'description': description,
      'type': type,
      'userId': userId,
    };
  }

  NotificationsModel copyWith({
    String? id,
    String? createdAt,
    String? updatedAt,
    String? title,
    String? description,
    String? type,
    String? userId,
  }) {
    return NotificationsModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      userId: userId ?? this.userId,
    );
  }
}
