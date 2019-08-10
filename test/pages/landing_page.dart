import 'dart:async';

import 'base_page.dart';
import 'package:flutter_gherkin/src/flutter/flutter_world.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:test/test.dart';

class LandingPage extends BasePage {

  final landingPageTitle = 'firstTabTitle';
  final scecondTabBtn = 'openBtn';

  LandingPage(FlutterDriver driver) : super(driver) {
    final locator = super.finElementByKey(landingPageTitle);
    BasePage.waitFor(driver, locator);
  }

  // Future _init(FlutterDriver driver) async {
  //   final locator = super.finElementByKey(landingPageTitle);
  //   await BasePage.waitFor(driver, locator);
  // }

  Future<void> goToSecondPage(FlutterWorld world) async {
    final locator = super.finElementByKey(scecondTabBtn);
    await BasePage.tap(world.driver, locator, world);
  }

  Future<void> tapPlusOneBtnForNTimes(String key, int times, FlutterWorld world) async {
    final locator = super.finElementByKey(key);
    for (var i = 0; i < times; i += 1) {
      await BasePage.tap(world.driver, locator, world);
    }
  }

  Future<void> compElementValue(String key, String value, FlutterWorld world) async {
    final text = await BasePage.getText(world.driver, find.byValueKey(key));
    expect(text, value);
  }
}
