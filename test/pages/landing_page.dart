import 'base_page.dart';
import 'package:flutter_gherkin/src/flutter/flutter_world.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:test/test.dart';

class LandingPage extends BasePage {
  LandingPage(FlutterDriver driver, String key) : super(driver) {
    final locator = find.byValueKey(key);
    BasePage.waitFor(driver, locator);
  }

  Future<void> tapPlusOneBtnForNTimes(String key, int times, FlutterWorld world) async {
    final locator = find.byValueKey(key);
    for (var i = 0; i < times; i += 1) {
      await BasePage.tap(world.driver, locator, world);
    }
  }

  Future<void> compElementValue(String key, String value, FlutterWorld world) async {
    final text = await BasePage.getText(world.driver, find.byValueKey(key));
    expect(text, value);

  }
}
