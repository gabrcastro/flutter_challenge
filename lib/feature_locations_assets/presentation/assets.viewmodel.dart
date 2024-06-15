import 'package:flutter/cupertino.dart';
import 'package:tractian_challenge/feature_locations_assets/data/repository/locations_assets.repository.implementation.dart';
import 'package:tractian_challenge/feature_locations_assets/domain/model/asset.model.dart';
import 'package:tractian_challenge/feature_locations_assets/domain/model/location.model.dart';

class AssetViewModel with ChangeNotifier {

  late LocationsAssetsRepositoryImpl repository;

  AssetViewModel({required this.repository});

    int selected = 0;
    setSelected(value) {
      if (selected == value) {
        selected = 0;
      } else {
        selected = value;
      }
      notifyListeners();
    }

    List<LocationModel> companyLocations = [];
    setCompanyLocations(locations) {
      companyLocations = locations;
      notifyListeners();
    }

    List<AssetModel> companyAssets = [];
    setCompanyAssets(assets) {
      companyAssets = assets;
      notifyListeners();
    }

    void getAllLocations(String companyId) async {
      var res = await repository.getCompanyLocations(companyId);
      setCompanyLocations(res);
      notifyListeners();
    }

    void getAllAssets(String companyId) async {
      var res = await repository.getCompanyAssets(companyId);
      setCompanyAssets(res);
      notifyListeners();
    }
}