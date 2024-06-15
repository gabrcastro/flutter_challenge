import 'package:tractian_challenge/feature_locations_assets/domain/model/asset.model.dart';
import 'package:tractian_challenge/feature_locations_assets/domain/model/location.model.dart';

abstract class LocationsAssetsRepositoryInterface {
  Future<List<LocationModel>> getCompanyLocations(String companyId);
  Future<List<AssetModel>> getCompanyAssets(String companyId);
}