import 'package:tractian_challenge/app/domain/model/company.model.dart';

abstract class AppRepositoryInterface {
  Future<List<CompanyModel>> getAllCompanies();
}