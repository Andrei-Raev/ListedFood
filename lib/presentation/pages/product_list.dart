import 'package:flutter/material.dart';
import 'package:listed_food/generated/l10n.dart';
import 'package:listed_food/presentation/widgets/check_edit_list/check_edit_list_element.dart';
import 'package:listed_food/presentation/widgets/page_template.dart';

import 'package:listed_food/core/constants/enums.dart'; // Предполагаемый новый путь
import 'package:listed_food/presentation/widgets/check_edit_list/check_edit_list.dart';
import 'package:listed_food/presentation/widgets/check_edit_list/check_edit_list_element_data_entity.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with AutomaticKeepAliveClientMixin {
  CheckEditList checkEditList = CheckEditList(data: []);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageTemplate(title: S.of(context).productList, child: checkEditList);
  }
} 