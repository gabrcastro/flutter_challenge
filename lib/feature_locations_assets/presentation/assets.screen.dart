import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_challenge/feature_locations_assets/domain/model/asset.model.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/assets.viewmodel.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/widgets/click_button.widget.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/widgets/textfield.widget.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/widgets/tree.widget.dart';
import 'package:tractian_challenge/ui/themes/colors.dart';
import 'package:tractian_challenge/ui/ui.dart';

import '../domain/model/location.model.dart';

class AssetsScreen extends StatefulWidget {
  final String companyId;

  const AssetsScreen({super.key, required this.companyId});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  AssetViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = Provider.of<AssetViewModel>(context, listen: false);
    _viewModel?.getAllLocations(widget.companyId);
    _viewModel?.getAllAssets(widget.companyId);
  }

  @override
  Widget build(BuildContext context) {
    // Organizando a estrutura de árvore
    List<LocationModel> locations = [];
    List<AssetModel> assets = [];
    List<TreeNode> rootNodes = [];
    Map<String, TreeNode> locationNodeMap = {};
    Map<String, TreeNode> assetNodeMap = {};

    for (var local in _viewModel!.companyLocations) {
      locations.add(local);
    }
    for (var asset in _viewModel!.companyAssets) {
      assets.add(asset);
    }

    // Criando nós de localização
    for (var location in locations) {
      locationNodeMap[location.id] = TreeNode(
        title: location.name,
        image:
            location.parentId == null ? UI.images.location : UI.images.active,
        children: [],
      );
    }
    for (var asset in assets) {
      assetNodeMap[asset.id] = TreeNode(
        title: asset.name,
        image: UI.images.component,
        sensorType: asset.sensorType,
        gatewayId: asset.gatewayId,
        locationId: asset.locationId,
        parentId: asset.parentId,
        sensorId: asset.sensorId,
        status: asset.status,
        children: [],
      );
    }

    // Organizando estrutura de árvore de localizações
    for (var location in locations) {
      if (location.parentId == null) {
        rootNodes.add(locationNodeMap[location.id]!);
      } else {
        var parentNode = locationNodeMap[location.parentId];
        if (parentNode != null) {
          parentNode.children.add(locationNodeMap[location.id]!);

          for (var asset in assets) {
            if (location.id == asset.locationId) {
              parentNode.children.add(assetNodeMap[asset.id]!);
            } else {
              parentNode.children.add(assetNodeMap[asset.id]!);
            }
          }
        }

      }
    }

    // Adicionando assets aos nós de localização
    // for (var asset in assets) {
    //   TreeNode assetNode = TreeNode(
    //     title: asset.name,
    //     image: UI.images.active,
    //     isChild: true,
    //     children: [],
    //   );
    //
    //   if (asset.locationId != null && locationNodeMap.containsKey(asset.locationId)) {
    //     locationNodeMap[asset.locationId]!.children.add(assetNode);
    //   } else if (asset.parentId != null && locationNodeMap.containsKey(asset.parentId)) {
    //     locationNodeMap[asset.parentId]!.children.add(assetNode);
    //   } else {
    //     rootNodes.add(assetNode);
    //   }
    // }

    return Consumer<AssetViewModel>(builder: (context, viewmodel, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: Text(
            UI.strings.assets,
            style: TextStyle(
              color: white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: white,
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 26, left: 26, right: 26, bottom: 15),
                  child: Column(
                    children: [
                      const TextFieldWidget(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClickButtonWidget(
                            icon: Icons.electric_bolt_rounded,
                            title: UI.strings.energySensor,
                            function: () {
                              viewmodel.setSelected(1);
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          ClickButtonWidget(
                            icon: Icons.info_outline_rounded,
                            title: UI.strings.critic,
                            function: () {
                              viewmodel.setSelected(2);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: grayLight,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: TreeView(nodes: rootNodes),
                  ),
                )
              ],
            );
          },
        ),
      );
    });
  }
}
