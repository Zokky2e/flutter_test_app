// purchase_history_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_app/common/custom_column.dart';
import 'package:flutter_test_app/components/bottom_bar/custom_bottom_bar.dart';
import 'package:flutter_test_app/components/custom_messages/custom_items_list_view.dart';
import 'package:flutter_test_app/components/custom_messages/custom_search_field.dart';
import 'package:flutter_test_app/components/custom_messages/purchase_item.dart';
import 'package:flutter_test_app/extensions/theme_extensions.dart';
import 'package:flutter_test_app/mocklist.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    List<PurchaseItem> purchaseItemList = MockList.purchaseItemList;
    return Scaffold(
      backgroundColor: context.colors.onSurface,
      body: SafeArea(
        left: false,
        right: false,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: BoxDecoration(color: context.colors.onSurface),
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              CustomBottomBar(initialTab: Tabs.notifs),
              Expanded(
                child: Row(
                  verticalDirection: VerticalDirection.up,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomColumn(
                        text: "Purchase History",
                        backgroundColor: context.colors.surface,
                        child: Column(
                          children: [
                            Expanded(flex: 1, child: CustomSearchField()),
                            Expanded(
                              flex: 9,
                              child: CustomItemsListView(
                                list: purchaseItemList,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
