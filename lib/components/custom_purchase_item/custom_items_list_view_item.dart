// custom_container.dart

import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/custom_purchase_item/purchase_item.dart';
import 'package:flutter_test_app/extensions/theme_extensions.dart';

class CustomItemsListViewItem extends StatelessWidget {
  final PurchaseItem item;
  final bool isSelected;
  final VoidCallback onTap;
  const CustomItemsListViewItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.fromLTRB(6, 6, 12, 6),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.secondary : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            ClipRRect(
              child: Image.network(item.imageUrl, width: 50, height: 50),
            ),
            SizedBox(width: 8),
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
                          color: isSelected
                              ? context.colors.onPrimary
                              : context.colors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${item.price}€",
                        style: TextStyle(
                          color: isSelected
                              ? context.colors.onPrimary
                              : context.colors.primary,
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
                        color: isSelected
                            ? context.colors.onPrimary
                            : context.colors.primary,
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
