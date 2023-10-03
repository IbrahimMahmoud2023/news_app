import 'package:flutter/material.dart';
import 'package:news_app/model/articals_model.dart';

class ArticleView extends StatelessWidget {
  Articles articalsModel;

  ArticleView(this.articalsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(articalsModel.urlToImage ?? "")),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                articalsModel.source?.name ?? "",
                style: TextStyle(color: Color(0xFF79828B), fontSize: 10),
              )),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                articalsModel.title ?? "",
              )),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                articalsModel.publishedAt ?? "",
                textAlign: TextAlign.end,
                style: TextStyle(color: Color(0xFF79828B), fontSize: 13),
              )),
        ],
      ),
    );
  }
}
