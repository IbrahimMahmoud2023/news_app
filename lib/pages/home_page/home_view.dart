import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/pages/home_page/category_view.dart';
import 'package:news_app/pages/home_page/widgets/drawer_widget.dart';
import 'package:news_app/pages/home_page/widgets/grid_view_item_widget.dart';

import '../../model/category_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categoryList = [
    CategoryModel(
      id: "sports",
      title: "Sports",
      image: "assests/image/sports_icon.png",
      backgroundColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: "politics",
      title: "Politics",
      image: "assests/image/politics_icon.png",
      backgroundColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      image: "assests/image/health_icon.png",
      backgroundColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      id: "business ",
      title: "Business ",
      image: "assests/image/bussines.png",
      backgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: "enviroment",
      title: "Enviroment",
      image: "assests/image/environment_icon.png",
      backgroundColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: "science",
      title: "Science",
      image: "assests/image/science_icon.png",
      backgroundColor: const Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assests/image/splash_pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(selectedCategory == null
              ? "News App"
              : selectedCategory!.title ?? "News App"),
        ),
        drawer: DrawerWidget(
            selectedCategory: selectedCategory, onPressed: onPressed),
        body: selectedCategory == null
            ? Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pick your category \n of interest",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F5A69),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12.0,
                            crossAxisSpacing: 12.0,
                            childAspectRatio: 7 / 8),
                        itemBuilder: (context, index) => GridViewItemWidget(
                          categoryModel: categoryList[index],
                          onClicked: onClicked,
                          index: index,
                        ),
                        itemCount: categoryList.length,
                      ),
                    ),
                  ],
                ),
              )
            : CategoryView(selected: selectedCategory!),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onClicked(CategoryModel categoryModel) {
    print("hallo ya shbab...");
    selectedCategory = categoryModel;
    setState(() {});
  }

  onPressed() {
    setState(() {
      selectedCategory = null;
      Navigator.pop(context);
      print("Hellow");
    });
  }
}
