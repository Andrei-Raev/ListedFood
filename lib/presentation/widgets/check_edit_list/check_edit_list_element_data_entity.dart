import 'package:listed_food/generated/json/base/json_field.dart';
import 'package:listed_food/generated/json/check_edit_list_element_data_entity.g.dart';
import 'dart:convert';
export 'package:listed_food/generated/json/check_edit_list_element_data_entity.g.dart';

@JsonSerializable()
class CheckEditListElementDataEntity {
  @JSONField(name: 'product_name')
  late String productName;
  @JSONField(name: 'measurement_type')
  late String measurementType;
  @JSONField(name: 'product_amount')
  late double productAmount;
  @JSONField(name: 'state')
  late bool state;

  CheckEditListElementDataEntity({
    required this.productName,
    required this.measurementType,
    required this.productAmount,
    required this.state,
  });

  factory CheckEditListElementDataEntity.fromJson(Map<String, dynamic> json) =>
      $CheckEditListElementDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $CheckEditListElementDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
} 