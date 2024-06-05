<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';

// Define a model for your reports
class Report {
  final String title;
  final String description;

  Report({required this.title, required this.description});
}

// Create a list of reports (dummy data for demonstration)
final List<Report> reports = [
  Report(
    title: "Report 1",
    description: "Description of Report 1",
  ),
  Report(
    title: "Report 2",
    description: "Description of Report 2",
  ),
  Report(
    title: "Report 2",
    description: "Description of Report 2",
  ),
  Report(
    title: "Report 2",
    description: "Description of Report 2",
  ),
  Report(
    title: "Report 2",
    description: "Description of Report 2",
  ),
  Report(
    title: "Report 2",
    description: "Description of Report 2",
  ),
  Report(
    title: "Report 2",
    description: "Description of Report 2",
  ),
  Report(
    title: "Report 2",
    description: "Description of Report 2",
  ),
  Report(
    title: "Report 2",
    description: "Description of Report 2",
  ),
  Report(
    title: "Report 2",
    description: "Description of Report 2",
  ),
  // Add more reports as needed
];
=======
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_en_clase201410/domain/models/us.dart';
import 'package:proyecto_en_clase201410/ui/controllers/us_controller.dart';

import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
>>>>>>> origin/dev

class HomepageUSWidget extends StatefulWidget {
  const HomepageUSWidget({Key? key}) : super(key: key);

  @override
  State<HomepageUSWidget> createState() => _HomepageUSWidgetState();
}

class _HomepageUSWidgetState extends State<HomepageUSWidget> {
<<<<<<< HEAD
=======
  User user = Get.arguments as User;
  USController usController = Get.find();

  @override
  void initState() {
    super.initState();
    usController.getReports();
  }

>>>>>>> origin/dev
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
<<<<<<< HEAD
          Get.toNamed('/soporte/createReport');
        },
        backgroundColor: Colors.blue, // Customize as needed
        elevation: 8.0,
        child: Icon(
=======
          Get.toNamed('/soporte/createReport', arguments: user);
        },
        backgroundColor: Colors.blue, // Customize as needed
        elevation: 8.0,
        child: const Icon(
>>>>>>> origin/dev
          Icons.add,
          color: Colors.white, // Customize as needed
          size: 24.0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'US Management',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    letterSpacing: 0.0,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
<<<<<<< HEAD
                  'username',
=======
                  user.firstName,
>>>>>>> origin/dev
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                      ),
                ),
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).accent1,
                  icon: Icon(
                    Icons.login_sharp,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () {
                    Get.offNamed('/login');
                  },
                ),
              ],
<<<<<<< HEAD
            ),
          ],
        ),
        actions: const [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity, // Occupy 100% of the width
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Disable scrolling of ListView.builder
                itemCount: reports.length,
                itemBuilder: (BuildContext context, int index) {
                  Report report = reports[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context)
                          .secondaryBackground, // Customize as needed
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              report.title,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              report.description,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
=======
            ),
          ],
        ),
        actions: const [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: double.infinity, // Occupy 100% of the width
              child: Obx(() => ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling of ListView.builder
                    itemCount: usController.reports
                        .where((reporte) => reporte.idUS == user.id)
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      var reporte = usController.reports
                          .where((reporte) => reporte.idUS == user.id)
                          .toList()[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Cambiado para espacio entre los elementos
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Report #${reporte.id}', // Mostrar el ID del reporte
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      reporte
                                          .horaInicio, // Mostrar la fecha de inicio del reporte
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Score: ${reporte.score}', // Mostrar el puntaje del reporte
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
>>>>>>> origin/dev
        ),
      ),
    );
  }
}
