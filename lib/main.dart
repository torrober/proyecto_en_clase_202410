import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:proyecto_en_clase201410/domain/repositories/repository.dart';
import 'package:proyecto_en_clase201410/domain/use_case/uc_usecase.dart';
import 'package:proyecto_en_clase201410/domain/use_case/us_usecase.dart';
import 'package:proyecto_en_clase201410/ui/controllers/login_controller.dart';
import 'package:proyecto_en_clase201410/index.dart';
import 'package:proyecto_en_clase201410/ui/controllers/uc_controller.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'ui/controllers/us_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Repository());
  Get.put(UCUseCase());
  Get.put(USUseCase());
  Get.put(LoginController());
  Get.put(USController());
  Get.put(UCController());
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
        GetPage(
            name: '/soporte/createReport',
            page: () => const CreateReportWidget()),
        GetPage(
            name: '/coordinador/editClient',
            page: () => const EditClientWidget()),
        GetPage(
            name: '/coordinador/editSoporte',
            page: () => const EditUSUserWidget()),
        GetPage(
            name: '/coordinador/report', page: () => const ReportPageWidget()),
      ],
    );
  }
}
