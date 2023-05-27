import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvelcomics/utils/app_Router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(BreakingBadApp(appRoute: AppRoute()));
}

class BreakingBadApp extends StatelessWidget {
  final AppRoute appRoute;

  const BreakingBadApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRoute.generateRoute,
      //debugShowCheckedModeBanner: false,
    );
  }
}
