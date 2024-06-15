import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_challenge/app/presentation/home.viewmodel.dart';
import 'package:tractian_challenge/app/presentation/widgets/company_item.widget.dart';
import 'package:tractian_challenge/ui/themes/colors.dart';
import 'package:tractian_challenge/ui/ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access inherited widgets here
    _viewModel = Provider.of<HomeViewModel>(context, listen: false);
    _viewModel?.getAllCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: darkBlue,
            title: Text(
              UI.strings.appName,
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
          body: LayoutBuilder(
            builder: (context, constraint) {
              return Container(
                width: constraint.maxWidth,
                height: constraint.maxHeight,
                padding: const EdgeInsets.all(26),
                child: ListView.builder(
                  itemCount: viewmodel.allCompanies.length,
                  itemBuilder: (context, index) {
                    return CompanyItem(company: viewmodel.allCompanies[index]);
                  },
                ),
              );
            },
          ),
        );
      }
    );
  }
}
