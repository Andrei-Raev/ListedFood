import 'package:flutter/material.dart';
import 'package:listed_food/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums.dart';

class SelectMenuType extends StatefulWidget {
  const SelectMenuType({super.key});

  @override
  State<SelectMenuType> createState() => _SelectMenuTypeState();
}

class _SelectMenuTypeState extends State<SelectMenuType> {
  int _selectedIndex = 0;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      this.prefs = prefs;
      setState(() {
        _selectedIndex = prefs.getInt('menuType') ?? 0;
      });
    });
  }

  String getNameFromEnum(MenuTypesEnum type, BuildContext context) {
    switch (type) {
      case MenuTypesEnum.any:
        return S.of(context).anyMT;
      case MenuTypesEnum.vegetarian:
        return S.of(context).vegetarianMT;
      case MenuTypesEnum.lenten:
        return S.of(context).lentenMT;
      case MenuTypesEnum.family:
        return S.of(context).familyMT;
      case MenuTypesEnum.fast:
        return S.of(context).fastMT;
      case MenuTypesEnum.aiGenerated:
        return S.of(context).aiGeneratedMT;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(S.of(context).selectMenuType),

        // LayoutBuilder(
        //   builder: (context, constraints) {
        //     // Предположим, по 2 элемента в строке
        //     double itemWidth = (constraints.maxWidth - 8) / 2; // 8 - между элементами
        //     return Wrap(
        //       spacing: 8.0,
        //       runSpacing: 8.0,
        //       children: List.generate(MenuTypesEnum.values.length, (index) {
        //         return SizedBox(
        //           width: itemWidth,
        //           height: 50, // задайте высоту по необходимости
        //           child: ChoiceChip(
        //             label: Text(getNameFromEnum(MenuTypesEnum.values[index], context)),
        //             selected: _selectedIndex == index,
        //             onSelected: (bool selected) {
        //               _selectedIndex = index;
        //               debugPrint('selectedIndex: $_selectedIndex');
        //               setState(() {});
        //             },
        //           ),
        //         );
        //       }),
        //     );
        //   },
        // )
        // ,
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: List<Widget>.generate(MenuTypesEnum.values.length, (index) {
            return ChoiceChip(
              label: Text(
                getNameFromEnum(MenuTypesEnum.values[index], context),
              ),
              selected: _selectedIndex == index,
              onSelected: (bool selected) {
                _selectedIndex = index;
                prefs.setInt('menuType', _selectedIndex);
                prefs.setString(
                  'menuTypeName',
                  MenuTypesEnum.values[index].name,
                );
                debugPrint('menuTypeName: ${MenuTypesEnum.values[index].name}');
                setState(() {});
              },
            );
          }),
        ),

        // (index) => RadioListTile<MenuTypesEnum>(
        //   title: Text(getNameFromEnum(MenuTypesEnum.values[index], context)),
        //   value: MenuTypesEnum.values[index],
        //   groupValue: MenuTypesEnum.values[_selectedIndex],
        //   onChanged: (MenuTypesEnum? value) {
        //     _selectedIndex = index;
        //     debugPrint('selectedIndex: $_selectedIndex');
        //     setState(() {});
        //   },
        // ),
        //   ),
        // ),
      ],
    );
  }
}
