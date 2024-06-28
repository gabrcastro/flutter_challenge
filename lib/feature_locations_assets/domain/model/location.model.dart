import 'dart:ui';

class LocationModel {
  String id;
  String? parentId;
  String name;
  List<dynamic>? children;

  LocationModel({
    required this.id,
    this.parentId,
    required this.name,
    this.children,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      parentId: json['parentId'],
      name: json['name'],
      children: (json['children'] as List?)?.map((child) => LocationModel.fromJson(child)).toList(),
    );
  }
}
