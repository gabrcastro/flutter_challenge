import 'package:flutter/material.dart';
import 'package:tractian_challenge/ui/themes/colors.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final String icon;
  final List<Widget> children;
  final bool isChild;
  final EdgeInsets tilePadding;
  final bool? isCritic;
  final bool? isEnergy;

  const CustomExpansionTile({super.key,
    required this.title,
    required this.children,
    required this.icon,
    required this.isChild,
    this.tilePadding = const EdgeInsets.only(left: 20.0),
    this.isEnergy,
    this.isCritic,
  });

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: ListTile(
            contentPadding: widget.tilePadding,
            leading: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              color: darkGray,
            ),
            title: Row(
              children: [
                if (!widget.isChild) const SizedBox(width: 10.0),
                Image(image: AssetImage(widget.icon), width: 15,),
                const SizedBox(width: 10,),
                widget.title,
                 widget.isCritic == true
                    ? Container(width: 30, height: 30, decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),) : const SizedBox.shrink(),
                widget.isEnergy == true ?
                    const Icon(Icons.electric_bolt_rounded, color: Colors.green, size: 20.0,)
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Column(
            children: widget.children.map((child) => Padding(
              padding: EdgeInsets.only(left: widget.tilePadding.left + 0.0),
              child: child,
            )).toList(),
          ),
      ],
    );
  }
}
