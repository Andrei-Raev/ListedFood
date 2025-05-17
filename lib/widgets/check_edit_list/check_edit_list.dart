import 'package:flutter/material.dart';

import 'check_edit_list_element.dart';
import 'check_edit_list_element_data_entity.dart';
import 'check_edit_list_element_empty.dart';

class CheckEditList extends StatefulWidget {
  final List<CheckEditListElementDataEntity> data;
  final VoidCallback? createEmptyElement;

  const CheckEditList({super.key, required this.data, this.createEmptyElement});

  @override
  CheckEditListState createState() => CheckEditListState();
}

class CheckEditListState extends State<CheckEditList> {
  late CheckEditListElementEmpty emptyElement;
  List<CheckEditListElement> elements = [];
  late List<CheckEditListElementDataEntity> data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    for (var element in data) {
      elements.add(CheckEditListElement(data: element));
    }

    if (widget.createEmptyElement != null) {
      widget.createEmptyElement!();
    }

    emptyElement = CheckEditListElementEmpty(onPress: createEmptyElement);
  }

  void createEmptyElement() {
    setState(() {
      data.add(
        CheckEditListElementDataEntity(
          productName: '',
          measurementType: '',
          productAmount: 0.0,
          state: false,
        ),
      );
      elements.add(CheckEditListElement(data: data.last));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => index == elements.length ? emptyElement : elements[index],
      itemCount: elements.length + 1,
    );
  }
}
