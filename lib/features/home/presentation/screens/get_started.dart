import 'package:flutter/material.dart';
import 'package:ibl_app/features/courses/presentation/screens/ai_catalog_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 25.h,
                width: 45.w,
                child: Image.asset("assets/images/ibl.png")),
            Text(
              'Welcome to IBL: the Education App!',
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.h),
            ElevatedButton(
              child: const Text('Get Started'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AiCatalogScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
