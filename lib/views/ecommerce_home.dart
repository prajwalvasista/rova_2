import 'package:flutter/material.dart';
import 'package:rova_2/utils/constants/colors.dart';
import 'package:rova_2/utils/constants/strings.dart';
import 'package:rova_2/views/categories.dart';

class EcommerceHome extends StatefulWidget {
  const EcommerceHome({super.key});

  @override
  State<EcommerceHome> createState() => _EcommerceHomeState();
}

class _EcommerceHomeState extends State<EcommerceHome> {
  final SizedBox defaultGap = const SizedBox(height: 10);
  final SizedBox defaultWidth = const SizedBox(width: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                prefixIcon: const Icon(Icons.search_outlined),
                prefixIconColor: AppColors.prefixIconColor,
                suffixIcon: const Icon(Icons.photo_camera_back_outlined),
                suffixIconColor: AppColors.suffixIconColor,
                hintText: CommonStrings.whatAreYouLookingFor,
                hintStyle: const TextStyle(
                  color: AppColors.hintTextFieldColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.suffixIconColor,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.grey, AppColors.primary],
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 158,
              width: double.infinity,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  CommonStrings.categories,
                  style: TextStyle(
                    color: AppColors.categoryTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  "assets/images/emoji.png",
                  height: 30,
                ),
                const SizedBox(width: 140),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      CommonStrings.seeAll,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.prefixIconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            defaultGap,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Categories(
                    text: CommonStrings.insectisides,
                    imagePath: "assets/images/insectdecides.png",
                  ),
                  defaultWidth,
                  const Categories(
                    text: CommonStrings.fertilizers,
                    imagePath: "assets/images/fertilizers.png",
                  ),
                  defaultWidth,
                  const Categories(
                    text: CommonStrings.machinery,
                    imagePath: "assets/images/tractor.png",
                  ),
                  defaultWidth,
                  const Categories(
                    text: CommonStrings.seeds,
                    imagePath: "assets/images/seeds.png",
                  ),
                ],
              ),
            ),
            defaultGap,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Categories(
                    text: CommonStrings.pesticides,
                    imagePath: "assets/images/pesticides.png",
                  ),
                  defaultWidth,
                  const Categories(
                    text: CommonStrings.plants,
                    imagePath: "assets/images/plants.png",
                  ),
                  defaultWidth,
                  const Categories(
                    text: CommonStrings.more,
                    imagePath: "assets/images/pesticides.png",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  CommonStrings.bestDeals,
                  style: TextStyle(
                    color: AppColors.categoryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  "assets/images/fireEmoji.png",
                  height: 30,
                ),
                const SizedBox(width: 140),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      CommonStrings.seeAll,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.prefixIconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
