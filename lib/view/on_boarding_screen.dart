import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/controllers/on_boarding_controller.dart';
import 'package:viswa_cab_vendor_app/view/authentication/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.selectedpageIndex,
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      controller.onboardingPages[index].image),
                                  fit: BoxFit.contain)),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.onboardingPages[index].title,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(
                            controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, color: black.withOpacity(0.4)),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                  children: List.generate(
                      controller.onboardingPages.length,
                      (index) => Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(4),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: controller.selectedpageIndex.value ==
                                          index
                                      ? blueGreen
                                      : black.withOpacity(0.2),
                                  shape: BoxShape.circle),
                            );
                          }))),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                backgroundColor: blueGreen,
                elevation: 0,
                onPressed: () {
                  controller.isLastPage
                      ? Get.offAll(LoginScreen())
                      : controller.forwardAction();
                },
                child: Obx(() {
                  return Text(
                    controller.isLastPage ? 'Start' : 'Next',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
