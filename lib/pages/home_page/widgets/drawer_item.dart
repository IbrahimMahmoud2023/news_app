import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItem extends StatelessWidget {
  String title;
  IconData iconData;
  Function onClick;

  DrawerItem({
    required this.iconData,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 40,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
