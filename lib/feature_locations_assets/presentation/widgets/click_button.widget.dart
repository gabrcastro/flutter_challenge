import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_challenge/feature_locations_assets/presentation/assets.viewmodel.dart';
import 'package:tractian_challenge/ui/themes/colors.dart';
import 'package:tractian_challenge/ui/ui.dart';

class ClickButtonWidget extends StatefulWidget {

  final Function() function;
  final IconData icon;
  final String title;

  const ClickButtonWidget({super.key,
    required this.function,
    required this.icon,
    required this.title,
  });

  @override
  State<ClickButtonWidget> createState() => _ClickButtonWidgetState();
}

class _ClickButtonWidgetState extends State<ClickButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AssetViewModel>(
      builder: (context, viewmodel, child) {
        return GestureDetector(
          onTap: widget.function,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: viewmodel.selected == 1 || viewmodel.selected == 2 ? blue : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: viewmodel.selected == 1 || viewmodel.selected == 2 ? blue : gray,
                width: 1.5,
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // asset
                Icon(widget.icon, color: viewmodel.selected == 1 || viewmodel.selected == 2 ? blue : gray, size: 16.0,),
                const SizedBox(width: 10,),
                // text
                Text(widget.title, style: TextStyle(
                  color: gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            ),
          ),
        );
      }
    );
  }
}
