import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/assets.viewmodel.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/widgets/click_button.widget.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/widgets/textfield.widget.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/widgets/tree.widget.dart';
import 'package:tractian_challenge/ui/themes/colors.dart';
import 'package:tractian_challenge/ui/ui.dart';

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

    List<TreeNode> treeData = [
      TreeNode(
        title: 'Node 1',
        image: UI.images.location,
        children: [
          TreeNode(title: 'Node 1.1',
            image: UI.images.component,
          ),
          TreeNode(
            title: 'Node 1.2',
            image: UI.images.component,
            children: [
              TreeNode(title: 'Node 1.2.1',
                image: UI.images.active,
                children: [
                  TreeNode(title: 'Node 1.2.1.1',
                    image: UI.images.active,
                  ),
                  TreeNode(title: 'Node 1.2.1.2',
                    image: UI.images.active,
                    children: [
                      TreeNode(title: 'Node 1.2.1.1',
                        image: UI.images.active,
                      ),
                      TreeNode(title: 'Node 1.2.1.2',
                        image: UI.images.active,
                      ),
                    ]
                  ),
                ]
              ),
              TreeNode(title: 'Node 1.2.2',
                image: UI.images.active,
              ),
            ],
          ),
        ],
      ),
      TreeNode(title: 'Node 2',
        image: UI.images.active,
      ),
      TreeNode(
        title: 'Node 3',
        image: UI.images.active,

        children: [
          TreeNode(title: 'Node 3.1',
            image: UI.images.active,
          ),
        ],
      ),
    ];

    return Consumer<AssetViewModel>(
      builder: (context, viewmodel, child) {
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
              icon: Icon(Icons.arrow_back, color: white,),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraint) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26, left: 26, right: 26, bottom: 15),
                    child: Column(
                      children: [
                        TextFieldWidget(),
                        const SizedBox(height: 10.0,),
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
                            const SizedBox(width: 10.0,),
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
                  Divider(height: 1, color: grayLight,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: TreeView(nodes: treeData),
                    ),
                  )
                ],
              );
            },
          ),
        );
      }
    );;
  }
}
