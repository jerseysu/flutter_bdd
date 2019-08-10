import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import '../pages/landing_page.dart';

class TapButtonNTimesStep extends When2WithWorld<String, int, FlutterWorld> {
  TapButtonNTimesStep()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 30));

  @override
  Future<void> executeStep(String key, int times) async {
    final landingPage = new LandingPage(world.driver);
    await landingPage.tapPlusOneBtnForNTimes(key, times, world);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button {int} times");
}
