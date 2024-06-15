import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_challenge/app.dart';
import 'package:tractian_challenge/app/data/repository/app.repository.implementation.dart';
import 'package:tractian_challenge/app/presentation/home.viewmodel.dart';
import 'package:tractian_challenge/feature_locations_assets/data/repository/locations_assets.repository.implementation.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/assets.viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  var providers = [
    ChangeNotifierProvider<AssetViewModel>(
      create: (_) => AssetViewModel(repository: LocationsAssetsRepositoryImpl()),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(repository: AppRepositoryImpl()),
    ),
  ];


  runApp(
      MultiProvider(
        providers: providers,
        child: const App(),
      ),
  );
}
