import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/src/flutter/utils/driver_utils.dart';
import 'package:flutter_gherkin/src/flutter/flutter_world.dart';

/// Expects the element found with the given control key to have the given string value.
///
/// Parameters:
///   1 - {string} the control key
///   2 - {string} the value of the control
///
/// Examples:
///
///   `Then I expect "controlKey" to be "Hello World"`
///   `And I expect "controlKey" to be "Hello World"`
class ExpectElementToHaveValue
    extends Then2WithWorld<String, String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r"I expect the {string} to be {string}");

  @override
  Future<void> executeStep(String key, String value) async {
    try {
      final text = await FlutterDriverUtils.getText(
          world.driver, find.byValueKey(key),
          timeout: timeout * .9);
      expect(text, value);
    } catch (e) {
      await reporter.message(
          "Step error '${pattern.pattern}': $e", MessageLevel.error);
      rethrow;
    }
  }
}