

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/models/on_boarding_model.dart';

class OnboardingController extends GetxController {
  var selectedpageIndex = 0.obs;
  bool get isLastPage => selectedpageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingModel> onboardingPages = [
    OnBoardingModel('assets/images/onboarding1.png', 'Add Cars',
        'Can add and organize your cars and drivers by yourself'),
    OnBoardingModel('assets/images/onboarding2.png', 'Real Time Locations',
        'Know the real time location of each and every cars'),
    OnBoardingModel('assets/images/onboarding3.png', 'Payment History',
        'Get complete history of your cars and drivers earings')
  ];
}
