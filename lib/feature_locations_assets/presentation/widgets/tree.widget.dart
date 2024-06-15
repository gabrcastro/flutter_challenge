import 'package:flutter/material.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/widgets/custom_expansion_tile.widget.dart';
import 'package:tractian_challenge/ui/themes/colors.dart';

class TreeNode {
  String title;
  String image;
  List<TreeNode> children;
  bool isChild;

  TreeNode({required this.title, required this.image, this.children = const [], this.isChild = false,});
}

class TreeView extends StatelessWidget {
  final List<TreeNode> nodes;

  const TreeView({super.key, required this.nodes});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: nodes.map((node) => TreeNodeWidget(node: node)).toList(),
    );
  }
}

class TreeNodeWidget extends StatelessWidget {
  final TreeNode node;

  const TreeNodeWidget({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    if (node.children.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ListTile(
          leading: Image(image: AssetImage(node.image), width: 15,),
          title: Text(node.title),
        ),
      );
    } else {
      return CustomExpansionTile(
        title: Text(
          node.title,
          style: TextStyle(
            color: darkGray,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: node.image,
        isChild: node.isChild,
        children: node.children.map((child) => TreeNodeWidget(node: child)).toList(),
      );
    }
  }
}