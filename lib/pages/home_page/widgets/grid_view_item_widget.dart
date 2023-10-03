import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/category_model.dart';

class GridViewItemWidget extends StatelessWidget {
  Function onClicked;
  CategoryModel categoryModel;
  int index;

  GridViewItemWidget(
      {required this.categoryModel,
      required this.index,
      required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
            color: categoryModel.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              bottomRight:
                  index % 2 == 0 ? Radius.circular(0) : Radius.circular(25),
              bottomLeft:
                  index % 2 == 0 ? Radius.circular(25) : Radius.circular(0),
              topRight: const Radius.circular(25),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image),
            const SizedBox(
              height: 6,
            ),
            Text(
              categoryModel.title,
              style: GoogleFonts.exo(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
