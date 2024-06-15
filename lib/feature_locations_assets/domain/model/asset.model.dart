class AssetModel {
  String id;
  String? gatewayId;
  String? locationId;
  String name;
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;

  AssetModel({
    required this.id,
    this.gatewayId,
    this.locationId,
    required this.name,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'],
      gatewayId: json['gatewayId'],
      locationId: json['locationId'],
      name: json['name'],
      parentId: json['parentId'],
      sensorId: json['sensorId'],
      sensorType: json['sensorType'],
      status: json['status'],
    );
  }
}
