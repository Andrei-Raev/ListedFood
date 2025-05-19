import 'package:flutter/material.dart';
import 'package:listed_food/generated/l10n.dart';
import 'package:listed_food/presentation/widgets/page_template.dart';

class MealList extends StatefulWidget {
  const MealList({super.key});

  @override
  MealListState createState() => MealListState();
}

class MealListState extends State<MealList> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: S.of(context).mealList,
      child: Container(color: Colors.green),
    );
  }
} 