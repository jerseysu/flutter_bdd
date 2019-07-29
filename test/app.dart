// ignore: avoid_relative_lib_imports
import 'package:hello_world/main.dart' as hello_world;
import 'package:flutter_driver/driver_extension.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  hello_world.main(); 
}
