// custom_container.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/custom_messages/custom_items_list_view_item.dart';
import 'package:flutter_test_app/components/custom_messages/purchase_item.dart';

class CustomItemsListView extends StatefulWidget {
  const CustomItemsListView({super.key, required this.list});
  final List<PurchaseItem> list;
  @override
  State<CustomItemsListView> createState() => _CustomItemsListViewState();
}

class _CustomItemsListViewState extends State<CustomItemsListView> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomItemsListViewItem(
          item: widget.list[index],
          isSelected: selectedItem == widget.list[index].id,
          onTap: () {
            setState(() {
              selectedItem = widget.list[index].id;
            });
          },
        );
      },
    );
  }
}
