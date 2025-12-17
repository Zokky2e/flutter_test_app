// custom_container.dart
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/custom_messages/purchase_item.dart';

class CustomItemsListViewItem extends StatelessWidget {
  final PurchaseItem item;
  bool isSelected = false;
  final VoidCallback onTap;
  CustomItemsListViewItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;
    Color onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color secondary = Theme.of(context).colorScheme.secondary;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        key: Key(item.id.toString()),
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.fromLTRB(6, 6, 12, 6),
        decoration: BoxDecoration(
          color: isSelected ? secondary : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          spacing: 8,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.network(item.imageUrl, width: 50, height: 50),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          color: isSelected ? onPrimary : primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${item.price}€",
                        style: TextStyle(
                          color: isSelected ? onPrimary : primary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      item.dateAdded,
                      style: TextStyle(
                        color: isSelected ? onPrimary : primary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
