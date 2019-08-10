import 'package:flutter_gherkin/src/flutter/flutter_world.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class BasePage extends FlutterWorld {
  
  BasePage(FlutterDriver driver, SerializableFinder finder, FlutterWorld world) {
    waitFor(driver, finder);
  }

  static Future<void> tap(FlutterDriver driver, SerializableFinder locator, FlutterWorld world) async {
    await FlutterDriverUtils.tap(world.driver, locator, timeout: Duration(seconds: 30));
  }

  SerializableFinder finElementByKey(FlutterDriver driver, String key, FlutterWorld world) {
    final element = find.byValueKey(key);
    return element;
  }

  static Future<void> waitFor(FlutterDriver driver, SerializableFinder finder,
      {Duration timeout = const Duration(seconds: 30)}) async {
    await driver.waitFor(finder, timeout: timeout);
    await FlutterDriverUtils.waitForFlutter(driver, timeout: timeout);
  }

  static Future<String> getText(FlutterDriver driver, SerializableFinder finder) async {
    await FlutterDriverUtils.waitForFlutter(driver, timeout: Duration(seconds: 30));
    final text = driver.getText(finder, timeout: Duration(seconds: 30));
    return text;
  }
}
