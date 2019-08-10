import 'dart:async';

import 'base_page.dart';
import 'package:flutter_gherkin/src/flutter/flutter_world.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class SecondPage extends BasePage {

  final secondPageTitle = 'firstTabTitle';
  final goBackBtn = 'goBackBtn';

  SecondPage(FlutterDriver driver) : super(driver) {
    final locator = super.finElementByKey(secondPageTitle);
    BasePage.waitFor(driver, locator);
  }

  // Future _init(FlutterDriver driver) async {
  //   final locator = super.finElementByKey(secondPageTitle);
  //   await BasePage.waitFor(driver, locator);
  // }

  Future<void> goToLandingPage(FlutterWorld world) async {
    final locator = super.finElementByKey(goBackBtn);
    await BasePage.tap(world.driver, locator, world);
  }
}
