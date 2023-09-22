import 'package:alowin_mini/page/page.dart';
import 'package:alowin_mini/routes/route_settings.dart';
import 'package:flutter/material.dart';

import 'utils/common/prefs_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await PrefsUtil.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alo Mini',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: CustomRouter.allRoutes,
      home: const SplashPage(),
    );
  }
}
