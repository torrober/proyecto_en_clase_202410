import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_u_s_widget.dart' show HomepageUSWidget;
import 'package:flutter/material.dart';

class HomepageUSModel extends FlutterFlowModel<HomepageUSWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
