import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rova_2/utils/constants/colors.dart';

class Categories extends StatelessWidget {
  final String text;
  final String imagePath;
  const Categories({super.key, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 75,
            height: 74,
            decoration: const BoxDecoration(
              color: AppColors.categoryColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.asset(imagePath),
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.categoryTextColor,
          ),
        ),
      ],
    );
  }
}
