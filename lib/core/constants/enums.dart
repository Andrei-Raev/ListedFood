import 'package:flutter/material.dart';
import 'package:listed_food/generated/l10n.dart';

enum FoodMeasurementTypesEnum { kilograms, grams, milliliters, liters, pieces }

String getFoodMeasurementTypeName(
  BuildContext context,
  FoodMeasurementTypesEnum type,
) {
  switch (type) {
    case FoodMeasurementTypesEnum.kilograms:
      return S.of(context).kilogram;
    case FoodMeasurementTypesEnum.grams:
      return S.of(context).gram;
    case FoodMeasurementTypesEnum.milliliters:
      return S.of(context).milliliter;
    case FoodMeasurementTypesEnum.liters:
      return S.of(context).liter;
    case FoodMeasurementTypesEnum.pieces:
      return S.of(context).piece;
  }
}

class FoodMeasurementTypes {
  late FoodMeasurementTypesEnum type;

  FoodMeasurementTypes({required this.type});

  String name(BuildContext context) {
    return getFoodMeasurementTypeName(context, type);
  }

  List<DropdownMenuItem<FoodMeasurementTypesEnum>> items(BuildContext context) {
    List<DropdownMenuItem<FoodMeasurementTypesEnum>> items = [];
    for (var item in FoodMeasurementTypesEnum.values) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(getFoodMeasurementTypeName(context, item)),
        ),
      );
    }
    return items;
  }
} 