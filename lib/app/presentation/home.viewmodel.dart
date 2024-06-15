import 'package:flutter/cupertino.dart';
import 'package:tractian_challenge/app/data/repository/app.repository.implementation.dart';
import 'package:tractian_challenge/app/domain/model/company.model.dart';

class HomeViewModel with ChangeNotifier {

  late AppRepositoryImpl repository;

  HomeViewModel({required this.repository});

  List<CompanyModel> allCompanies = [];
  setAllCompanies(companies) {
    allCompanies = companies;
    notifyListeners();
  }

  void getAllCompanies() async {
    var res = await repository.getAllCompanies();
    setAllCompanies(res);
    notifyListeners();
  }

}