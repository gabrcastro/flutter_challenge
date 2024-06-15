import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/domain/model/company.model.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/assets.screen.dart';
import 'package:tractian_challenge/ui/themes/colors.dart';

class CompanyItem extends StatelessWidget {
  final CompanyModel company;

  const CompanyItem({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AssetsScreen(companyId: company.id);
            }));
          },
          child: Container(
            width: constraint.maxWidth,
            height: constraint.maxWidth / 4,
            margin: const EdgeInsets.only(bottom: 30.0),
            padding: const EdgeInsets.only(left: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // asset
                Icon(Icons.business_rounded, color: white,),
                const SizedBox(width: 20,),
                // text
                Text(company.name, style: TextStyle(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ),
        );
      }
    );
  }
}
