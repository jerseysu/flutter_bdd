import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import '../pages/landing_page.dart';
import '../pages/second_page.dart';

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

class GoToPage extends Given1WithWorld<String, FlutterWorld> {
  GoToPage()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 30));

  @override
  Future<void> executeStep(String page) async {
    switch (page) {
      case "second":
        final landingPage = new LandingPage(world.driver);
        await landingPage.goToSecondPage(world);
        break;
      case "landing":
        final secondPage = new SecondPage(world.driver);
        await secondPage.goToLandingPage(world);
        break;
    }
  }

  @override
  RegExp get pattern => RegExp(r"I go to (landing|second) page");
}

class ExpectElementToHaveValue
    extends Then2WithWorld<String, String, FlutterWorld> {

  @override
    RegExp get pattern => RegExp(r"I expect (landing|second) page title to be {string}");

  @override
  Future<void> executeStep(String page, String value) async {
      switch (page) {
      case "second":
        final secondPage = new SecondPage(world.driver);
        await secondPage.compSecondPageTitleValue(value, world);
        break;
      case "landing":
        final landingPage = new LandingPage(world.driver);
        await landingPage.compLandingPageTitleValue(value, world);
        break;
    }
  }
}