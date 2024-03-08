import 'package:flutter/material.dart';
import 'package:rova_2/utils/constants/colors.dart';
import 'package:rova_2/views/gst_verification.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({super.key});

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: AppColors.primary,
        leading: Image.asset(
          "assets/images/img.png",
          width: 67,
          height: 62,
        ),
      ),
      endDrawer: const Drawer(
        backgroundColor: AppColors.textColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(57, 168, 5, 250),
              child: Image.asset(
                "assets/images/registration.png",
                width: 355,
                height: 250,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, GstVerification.appRoute);
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(
                    300,
                    59,
                  ),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  AppColors.primary,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Complete Registration",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
