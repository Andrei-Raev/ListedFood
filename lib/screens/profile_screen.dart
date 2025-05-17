import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listed_food/generated/l10n.dart';
import 'package:listed_food/widgets/page_template.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: S.of(context).profile,
      child: Column(
        children: [
          SizedBox(
            height:
                (Theme.of(context).textTheme.bodyMedium!.fontSize ?? 16) * 2.2,
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left:
                      Theme.of(context).textTheme.bodyMedium!.fontSize! ??
                      16,
                ),
              ),
              onPressed: () {Navigator.push(context, SwipeablePageRoute(builder: (context) => SettingsScreen()));},
              child: Text(S.of(context).settings),
            ),
          ),
        ],
      ),
    );
  }
}
