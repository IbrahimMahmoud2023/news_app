import 'package:flutter/material.dart';
import 'package:news_app/model/source_model.dart';
import 'package:news_app/pages/home_page/widgets/atticls_list_view.dart';
import 'package:news_app/pages/home_page/widgets/tab_item.dart';

class TabBarListView extends StatefulWidget {
  SourceModel sourceModel;

  TabBarListView(
    this.sourceModel,
  );

  @override
  State<TabBarListView> createState() => _TabBarListViewState();
}

class _TabBarListViewState extends State<TabBarListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          DefaultTabController(
              initialIndex: selectedIndex,
              length: widget.sourceModel.sources?.length ?? 0,
              child: TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 6),
                  isScrollable: true,
                  indicator: const BoxDecoration(),
                  //     labelPadding: EdgeInsets.all(12),
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  tabs: widget.sourceModel.sources?.map((
                        element,
                      ) {
                        return TabItem(
                            element,
                            selectedIndex ==
                                widget.sourceModel.sources!.indexOf(element));
                      }).toList() ??
                      [])),
          ArticlsListView(widget.sourceModel.sources?[selectedIndex].id ?? ""),
        ],
      ),
    );
  }
}
