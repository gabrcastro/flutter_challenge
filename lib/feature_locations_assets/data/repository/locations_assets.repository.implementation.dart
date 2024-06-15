import 'package:tractian_challenge/feature_locations_assets/data/api/api.service.dart';
import 'package:tractian_challenge/feature_locations_assets/domain/model/asset.model.dart';
import 'package:tractian_challenge/feature_locations_assets/domain/model/location.model.dart';
import 'package:tractian_challenge/feature_locations_assets/domain/repository/locations_assets.repository.dart';

class LocationsAssetsRepositoryImpl implements LocationsAssetsRepositoryInterface {
  ApiServiceAssets api = ApiServiceAssets();

  @override
  Future<List<AssetModel>> getCompanyAssets(String companyId) async {
    var res = await api.getAssets(companyId);
    return res;
  }

  @override
  Future<List<LocationModel>> getCompanyLocations(String companyId) async {
    var res = await api.getLocations(companyId);
    return res;
  }

}