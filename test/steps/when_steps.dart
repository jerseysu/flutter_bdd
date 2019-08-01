import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapButtonNTimesStep extends When2WithWorld<String, int, FlutterWorld> {
  TapButtonNTimesStep()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String key, int times) async {
    final locator = find.byValueKey(key);
    for (var i = 0; i < times; i += 1) {
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    }
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button {int} times");
}