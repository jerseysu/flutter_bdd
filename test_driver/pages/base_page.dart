import 'dart:async';
import 'package:flutter_gherkin/src/flutter/flutter_world.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class BasePage extends FlutterWorld {
  static final timeout = Duration(seconds: 30);
  
  BasePage(FlutterDriver driver) {
    print (driver);
  }

  static Future<void> tap(FlutterDriver driver, SerializableFinder locator, FlutterWorld world) async {
    try {
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    } catch (error) {
      print('Element does not exists => $error)');
    }
  }

  SerializableFinder finElementByKey(String key) {
    return find.byValueKey(key);
  }

  static Future<void> waitFor(FlutterDriver driver, SerializableFinder finder,
      {Duration timeout = const Duration(seconds: 30)}) async {
    try {
      await driver.waitFor(finder, timeout: timeout);
      await FlutterDriverUtils.waitForFlutter(driver, timeout: timeout);
    } catch (error) {
      print('Element does not exists => $error');
    }
  }

  static Future<String> getText(FlutterDriver driver, SerializableFinder finder) async {
    await FlutterDriverUtils.waitForFlutter(driver, timeout: timeout);
    final text = driver.getText(finder, timeout: timeout);
    return text;
  }

  static void compareText(String actual, String matcher) {
    // TODO: expect not work, expect(actual, matcher); 
    // Exception: Bad state: expect() may only be called within a test.
    if (actual != matcher) {
      throw ("$actual is not match $matcher");
    }
  }
}
