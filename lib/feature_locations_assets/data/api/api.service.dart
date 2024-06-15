import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tractian_challenge/app/domain/model/company.model.dart';
import 'package:tractian_challenge/core/constants.dart';
import 'package:tractian_challenge/feature_locations_assets/domain/model/asset.model.dart';
import 'package:tractian_challenge/feature_locations_assets/domain/model/location.model.dart';

class ApiServiceAssets {

  Future<List<LocationModel>> getLocations(companyId) async {
    try {
      var response = await http.get(Uri.parse("$API/companies/$companyId/locations"));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<LocationModel> locations = jsonResponse.map((location) {
          return LocationModel.fromJson(location);
        }).toList();

        return locations;
      } else {
        throw Exception('Falha ao carregar localizações');
      }
    } catch (e) {
      throw Error();
    }
  }

  Future<List<AssetModel>> getAssets(companyId) async {
    try {
      var response = await http.get(Uri.parse("$API/companies/$companyId/assets"));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<AssetModel> assets = jsonResponse.map((asset) {
          return AssetModel.fromJson(asset);
        }).toList();

        return assets;
      } else {
        throw Exception('Falha ao carregar ativos');
      }
    } catch (e) {
      throw Exception('Erro ao carregar ativos: $e');
    }
  }

}