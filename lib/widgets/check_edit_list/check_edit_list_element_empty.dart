import 'package:flutter/material.dart';
import 'package:listed_food/generated/l10n.dart';

class CheckEditListElementEmpty extends StatelessWidget {
  final VoidCallback? onPress;
  const CheckEditListElementEmpty({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPress,
      child: Column(
        children: [
          SizedBox(height: (Theme.of(context).textTheme.bodyMedium!.fontSize ?? 16) /4),
          Row(
            children: <Widget>[
              SizedBox(
              width: (Theme.of(context).textTheme.bodyMedium!.fontSize ?? 16) * 3,
              child: Icon(Icons.add, color: Colors.grey)),
              Text(S.of(context).addElement, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
