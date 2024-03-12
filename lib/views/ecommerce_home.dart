import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rova_2/utils/constants/colors.dart';
import 'package:rova_2/utils/constants/strings.dart';

class EcommerceHome extends StatefulWidget {
  const EcommerceHome({super.key});

  @override
  State<EcommerceHome> createState() => _EcommerceHomeState();
}

class _EcommerceHomeState extends State<EcommerceHome> {
  final SizedBox defaultGap = const SizedBox(height: 10);
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
