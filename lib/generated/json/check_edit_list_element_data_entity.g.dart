import 'package:listed_food/generated/json/base/json_convert_content.dart';
import 'package:listed_food/presentation/widgets/check_edit_list/check_edit_list_element_data_entity.dart';

CheckEditListElementDataEntity $CheckEditListElementDataEntityFromJson(
  Map<String, dynamic> json,
) {
  final CheckEditListElementDataEntity checkEditListElementDataEntity =
      CheckEditListElementDataEntity(
        productName: "",
        measurementType: "",
        productAmount: 0,
        state: false,
      );
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    checkEditListElementDataEntity.productName = productName;
  }
  final String? measurementType = jsonConvert.convert<String>(
    json['measurement_type'],
  );
  if (measurementType != null) {
    checkEditListElementDataEntity.measurementType = measurementType;
  }
  final double? productAmount = jsonConvert.convert<double>(
    json['product_amount'],
  );
  if (productAmount != null) {
    checkEditListElementDataEntity.productAmount = productAmount;
  }

  final bool? state = jsonConvert.convert<bool>(json['state']);
  if (state != null) {
    checkEditListElementDataEntity.state = state;
  }
  return checkEditListElementDataEntity;
}

Map<String, dynamic> $CheckEditListElementDataEntityToJson(
  CheckEditListElementDataEntity entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['product_name'] = entity.productName;
  data['measurement_type'] = entity.measurementType;
  data['product_amount'] = entity.productAmount;
  data['state'] = entity.state;
  return data;
}

extension CheckEditListElementDataEntityExtension
    on CheckEditListElementDataEntity {
  CheckEditListElementDataEntity copyWith({
    String? productName,
    String? measurementType,
    double? productAmount,
    bool? state,
  }) {
    return CheckEditListElementDataEntity(
      productName: productName ?? this.productName,
      measurementType: measurementType ?? this.measurementType,
      state: state ?? this.state,
      productAmount: productAmount ?? this.productAmount,
    );
  }
}
