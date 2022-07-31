import 'dart:convert';

class DataModel {
  int userId;
  int id;
  String title;
  String body;
  DataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  DataModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return DataModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DataModel &&
      other.userId == userId &&
      other.id == id &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      body.hashCode;
  }
}
