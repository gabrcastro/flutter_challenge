import 'package:tractian_challenge/app/data/api/api.service.dart';
import 'package:tractian_challenge/app/domain/model/company.model.dart';
import 'package:tractian_challenge/app/domain/repository/app.repository.dart';

class AppRepositoryImpl implements AppRepositoryInterface {

  ApiService api = ApiService();

  @override
  Future<List<CompanyModel>> getAllCompanies() async {
    var res = await api.getCompanies();
    return res;
  }
}