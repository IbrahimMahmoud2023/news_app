import 'package:flutter/material.dart';
import 'package:news_app/model/articals_model.dart';
import 'package:news_app/pages/home_page/widgets/article_view_item.dart';
import 'package:news_app/shared_component/network/api_manager.dart';

class ArticlsListView extends StatelessWidget {
  String sourceId;

  ArticlsListView(this.sourceId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticalsModel>(
      future: ApiManager.fetchNewsList(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              Text("${snapshot.error}"),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh_outlined),
              )
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var articllist = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ArticleView(articllist[index]);
              },
              itemCount: articllist.length,
            ),
          );
        }
      },
    );
  }
}
