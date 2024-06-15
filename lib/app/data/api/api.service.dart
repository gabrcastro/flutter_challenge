import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tractian_challenge/app/domain/model/company.model.dart';
import 'package:tractian_challenge/core/constants.dart';

class ApiService {
  Future<List<CompanyModel>> getCompanies() async {
    try {
      var response = await http.get(Uri.parse("$API/companies"));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<CompanyModel> companies = jsonResponse.map((company) {
          return CompanyModel(
            id: company['id'],
            name: company['name'],
          );
        }).toList();

        return companies;
      } else {
        throw Exception('Falha ao carregar empresas');
      }
    } catch (e) {
      throw Error();
    }
  }

}