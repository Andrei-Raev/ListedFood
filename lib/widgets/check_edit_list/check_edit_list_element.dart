import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listed_food/constants/enums.dart';
import 'package:listed_food/constants/themes.dart';

import '../../generated/l10n.dart';
import 'check_edit_list_element_data_entity.dart';

class CheckEditListElement extends StatefulWidget {
  final CheckEditListElementDataEntity data;

  const CheckEditListElement({super.key, required this.data});

  @override
  CheckEditListElementState createState() => CheckEditListElementState();
}

class CheckEditListElementState extends State<CheckEditListElement> {
  late bool state;
  bool editMode = false;
  late String productName;
  late double amount;
  late FoodMeasurementTypes measurementType;
  late TextEditingController _nameController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();

    state = widget.data.state;
    productName = widget.data.productName;
    amount = widget.data.productAmount;

    try {
      measurementType = FoodMeasurementTypes(
        type: FoodMeasurementTypesEnum.values.byName(
          widget.data.measurementType,
        ),
      );
    } catch (e) {
      measurementType = FoodMeasurementTypes(
        type: FoodMeasurementTypesEnum.grams,

      );
    }

    _nameController = TextEditingController(text: productName);
    _amountController = TextEditingController(text: '$amount');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onChanged(bool? value) {
    setState(() {
      state = value ?? !state;
      widget.data.state = state;
    });
  }

  void _changeEditMode(bool value) {
    setState(() {
      editMode = value;
    });
  }

  void _editAmount(String value) {
    setState(() {
      amount = double.tryParse(value) ?? amount;
      widget.data.productAmount = amount;
    });
  }

  void _editMeasurementType(FoodMeasurementTypesEnum? value) {
    setState(() {
      if (value == null) return;
      measurementType = FoodMeasurementTypes(type: value);
      widget.data.measurementType = measurementType.type.name;
    });
  }

  void _editProductName(String value) {
    setState(() {
      productName = value;
      widget.data.productName = productName;
    });
  }

  Widget buildEditable() {
    return Row(
      children: [
        Checkbox(value: state, onChanged: _onChanged),
        Expanded(
          child: TextField(
            controller: _nameController,
            onChanged: _editProductName,
            decoration: inputDecoration.copyWith(
              hintText: S.of(context).CheckEditListElementStateMainInputHint,
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
            ),
          ),
        ),

        SizedBox(
          width: (Theme.of(context).textTheme.bodyMedium!.fontSize ?? 16) / 2,
        ),

        SizedBox(
          width: .14 * MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: _amountController,
            onChanged: _editAmount,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'\d+\.?\d*')),
            ],
            decoration: inputDecoration.copyWith(
              hintText:
                  S.of(context).CheckEditListElementStateMeasurementInputHint,
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
            ),
          ),
        ),

        SizedBox(
          width: (Theme.of(context).textTheme.bodyMedium!.fontSize ?? 16) / 8,
        ),

        DropdownButton(
          items: measurementType.items(context),
          onChanged: _editMeasurementType,
          value: measurementType.type,
          iconSize: 0,
        ),

        IconButton(
          icon: const Icon(Icons.done),
          onPressed: () => _changeEditMode(false),
        ),
      ],
    );
  }

  Widget buildStatic() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () => _changeEditMode(true),
      onTapUp: (_) => _onChanged(null),
      child: Row(
        children: [
          Checkbox(value: state, onChanged: _onChanged),
          Text(
            productName != ''
                ? productName
                : S.of(context).CheckEditListElementStateMainInputHint,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: productName != '' ? null : Colors.grey,
            ),
          ),
          const Spacer(),
          Text('$amount ${measurementType.name(context)}'),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _changeEditMode(true),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return editMode ? buildEditable() : buildStatic();
  }
}
