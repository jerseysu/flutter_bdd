# flutter_bdd
> Sample Project for Flutter + flutter_gherkin demo

[![jerseysu](https://circleci.com/gh/jerseysu/flutter_bdd.svg?style=svg)](https://app.circleci.com/pipelines/github/jerseysu/flutter_bdd)

The sample project is based on following instruction:

- Flutter Developer Library: [Hello World](https://github.com/flutter/flutter/tree/master/examples/hello_world) / [Navigate to a new screen and back](https://flutter.dev/docs/cookbook/navigation/navigation-basics)


- flutter_gherkin  sample: [Flutter-Ghkerin Lib](https://github.com/jonsamwell/flutter_gherkin)

![](flutter_bdd_demo_iOS.gif)

## Requirements

- Flutter v2.0.1
- [flutter_gherkin](https://pub.dartlang.org/packages/flutter_gherkin)
- Xcode 12.2
- Android Studio 3.1.4

## flutter_gherkin Installation:

Setup flutter_gherkin into pubspec.yaml dependencies:

```dart
dependencies:
    flutter_gherkin: ^1.1.9
```

Adding a package dependency to an app:
```
# Install
$ flutter pub get
```

## Execution Test:

### Execute target to iOS / Android:
- Use flutter devices to get target device id
```
# run flutter devices
$ flutter devices
```

- Config targetDeviceId in [app_test.dart](test/app_test.dart#L24)
```
Ex: (Android), default empty string
..targetDeviceId = "emulator-5554"
```

- Execute command line with target devices
```
# execute command line
$ dart test_driver/app_test.dart

or 

$ flutter drive --target=test_driver/app.dart
```

![](flutter_bdd_demo_Andriod.gif)

## Useful Sample:

- Page Object Patterns
```
class LandingPage extends BasePage {

  final landingPageTitle = 'firstTabTitle';

  LandingPage(FlutterDriver driver) : super(driver) {
    final locator = super.finElementByKey(landingPageTitle);
    BasePage.waitFor(driver, locator);
  }

  Future<void> doSomething(FlutterWorld world) async {
    // doSomehting

  }
}
```

- Step Definition
```
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

```

- Test Report

1. Install npm package `cucumber-html-reporter`  
```
# Install cucumber-html-reporter
$ npm install cucumber-html-reporter
```

2. Display Report
```
# Go to report folder
$ cd report

# Display Report
$ node index.js
```

## Documentation:

Blog: - [Gherkin with Flutter](https://medium.com/@loverjersey/%E7%8E%A9%E4%B8%80%E7%8E%A9-flutter-gherkin-gherkin-with-flutter-b84e246f50a2)


## Author

Jersey Su – [@jerseysu](https://twitter.com/jerseysu) 
