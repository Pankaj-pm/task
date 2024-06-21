import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/theme_provider.dart';
import 'package:provider_test/view/home_page.dart';
import 'package:provider_test/provider/counter_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ],
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (BuildContext context, ThemeProvider value, Widget? child) => MaterialApp(
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              useMaterial3: true,
              textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.yellow,fontSize: 30)),

            ),
            themeMode: value.isDart ? ThemeMode.dark:ThemeMode.light,
            home: const HomeScreen(),
          ),
        );
      },
    );
    // return ChangeNotifierProvider(
    //   create: (BuildContext context) {
    //     return CounterProvider();
    //   },
    //   builder: (context, child) {
    //     return MaterialApp(
    //       theme: ThemeData.light(useMaterial3: true),
    //       darkTheme: ThemeData(
    //         brightness: Brightness.dark,
    //         useMaterial3: true,
    //       ),
    //       themeMode: ThemeMode.system,
    //       home: const HomeScreen(),
    //     );
    //   },
    // );
  }
}
