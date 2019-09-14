# flutter_bdd
> Sample Project for Flutter + flutter_gherkin demo

The sample project is based on following instruction:

- Flutter Developer Library: [Hello World](https://github.com/flutter/flutter/tree/master/examples/hello_world) / [Navigate to a new screen and back](https://flutter.dev/docs/cookbook/navigation/navigation-basics)


- flutter_gherkin  sample: [Flutter-Ghkerin Lib](https://github.com/jonsamwell/flutter_gherkin)

![](flutter_bdd_demo_iOS.gif)

## Requirements

- Flutter v1.7.8+hotfix.4
- [flutter_gherkin](https://pub.dartlang.org/packages/flutter_gherkin)
- Xcode 10.1
- Android Studio

## flutter_gherkin Installation:

Setup flutter_gherkin into pubspec.yaml dependencies:

```dart
dependencies:
    flutter_gherkin: ^1.0.0
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
$ dart test/app_test.dart
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

## Documentation:
> WIP~



## Author

Jersey Su – [@jerseysu](https://twitter.com/jerseysu) 
