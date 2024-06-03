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

class HomepageUSWidget extends StatefulWidget {
  const HomepageUSWidget({Key? key}) : super(key: key);

  @override
  State<HomepageUSWidget> createState() => _HomepageUSWidgetState();
}

class _HomepageUSWidgetState extends State<HomepageUSWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/soporte/createReport');
        },
        backgroundColor: Colors.blue, // Customize as needed
        elevation: 8.0,
        child: Icon(
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
                  'username',
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
        ),
      ),
    );
  }
}
