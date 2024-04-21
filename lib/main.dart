import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:proyecto_en_clase201410/controllers/login_controller.dart';
import 'package:proyecto_en_clase201410/index.dart';
import 'flutter_flow/flutter_flow_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginController());
  usePathUrlStrategy();

  await FlutterFlowTheme.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ProyectoEnClase201410',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const HomePageWidget()),
        GetPage(name: '/coordinador', page: () => const UCHomepageWidget()),
        GetPage(name: '/soporte', page: () => const HomepageUSWidget()),
        GetPage(name: '/soporte/createReport', page: () => const CreateReportWidget()),
        GetPage(name: '/coordinador/editClient', page: () => const EditClientWidget()),
        GetPage(name: '/coordinador/editSoporte', page: () => const EditUSUserWidget()),
        GetPage(name: '/coordinador/report', page: () => const ReportPageWidget()),
      ],
    );
  }
}
