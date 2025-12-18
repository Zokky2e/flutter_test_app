import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test_app/app_routing.dart';
import 'package:flutter_test_app/common/my_app_color_scheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colorScheme = MyAppColorScheme();
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useSystemColors: true,
        colorScheme: colorScheme,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(color: colorScheme.onPrimary),
          bodyMedium: TextStyle(color: colorScheme.onPrimary),
          bodyLarge: TextStyle(color: colorScheme.onPrimary),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: colorScheme.primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.onPrimary, width: 2),
          ),
        ),
      ),
      routerConfig: appRouter,
    );
  }
}

class CupertinoPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    throw UnimplementedError();
  }
}
