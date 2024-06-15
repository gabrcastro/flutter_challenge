class LocationModel {
  String id;
  String name;
  String? parentId;

  LocationModel({required this.id, required this.name, this.parentId});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
    );
  }
}
