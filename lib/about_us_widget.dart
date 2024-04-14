// import '/backend/backend.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'about_us_model.dart';
export 'about_us_model.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({super.key});

  @override
  State<AboutUsWidget> createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  late AboutUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsModel());

    // logFirebaseEvent('screen_view', parameters: {'screen_name': 'AboutUs'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    // child: StreamBuilder<List<CompanyInformationRecord>>(
                    //   stream: queryCompanyInformationRecord(
                    //     singleRecord: true,
                    //   ),
                    //   builder: (context, snapshot) {
                    //     // Customize what your widget looks like when it's loading.
                    //     if (!snapshot.hasData) {
                    //       return Center(
                    //         child: SizedBox(
                    //           width: 25,
                    //           height: 25,
                    //           child: CircularProgressIndicator(
                    //             valueColor: AlwaysStoppedAnimation<Color>(
                    //               FlutterFlowTheme.of(context).primary,
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     }
                    //     // List<CompanyInformationRecord>
                    //     //     columnCompanyInformationRecordList = snapshot.data!;
                    //     // Return an empty Container when the item does not exist.
                    //     if (snapshot.data!.isEmpty) {
                    //       return Container();
                    //     }
                    //     // final columnCompanyInformationRecord =
                    //     //     columnCompanyInformationRecordList.isNotEmpty
                    //     //         ? columnCompanyInformationRecordList.first
                    //     //         : null;
                    //     return Column(
                    //       mainAxisSize: MainAxisSize.max,
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         wrapWithModel(
                    //           model: _model.customAppbarModel,
                    //           updateCallback: () => setState(() {}),
                    //           child: CustomAppbarWidget(
                    //             backButton: true,
                    //             actionButton: false,
                    //             actionButtonAction: () async {},
                    //             optionsButtonAction: () async {},
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding:
                    //               EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                    //           child: Text(
                    //             'About Us',
                    //             style: FlutterFlowTheme.of(context)
                    //                 .displaySmall
                    //                 .override(
                    //                   fontFamily: 'Inter',
                    //                   letterSpacing: 0,
                    //                 ),
                    //           ),
                    //         ),
                    //         // if (columnCompanyInformationRecord?.coverImage !=
                    //         //         null &&
                    //         //     columnCompanyInformationRecord?.coverImage !=
                    //         //         '')
                    //           Padding(
                    //             padding:
                    //                 EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                    //             child: Container(
                    //               width: double.infinity,
                    //               height: 200,
                    //               decoration: BoxDecoration(
                    //                 color: FlutterFlowTheme.of(context)
                    //                     .secondaryBackground,
                    //                 image: DecorationImage(
                    //                   fit: BoxFit.cover,
                    //                   image: Image.network(
                    //                     valueOrDefault<String>(
                    //                       "columnCompanyInformationRecord ?.coverImage",
                    //                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtl8BH13Y06Qv2CuLInSAY-X-nRsiMAOBMfzc9KatlXQ&s',
                    //                     ),
                    //                   ).image,
                    //                 ),
                    //                 borderRadius: BorderRadius.circular(12),
                    //               ),
                    //               child: Visibility(
                    //                 // visible: columnCompanyInformationRecord ? .logo != null && columnCompanyInformationRecord ?.logo !=
                    //                 //         '',
                    //                 child: Align(
                    //                   alignment: AlignmentDirectional(-1, -1),
                    //                   child: Padding(
                    //                     padding: EdgeInsetsDirectional.fromSTEB(
                    //                         12, 12, 0, 0),
                    //                     child: Container(
                    //                       width: 80,
                    //                       height: 80,
                    //                       decoration: BoxDecoration(
                    //                         image: DecorationImage(
                    //                           fit: BoxFit.contain,
                    //                           image: Image.network(
                    //                             "columnCompanyInformationRecord!"
                    //                           ).image,
                    //                         ),
                    //                         borderRadius:
                    //                             BorderRadius.circular(8),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         Padding(
                    //           padding:
                    //               EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                    //           child: Text(
                    //            "My App 1",
                    //             style: FlutterFlowTheme.of(context)
                    //                 .displaySmall
                    //                 .override(
                    //                   fontFamily: 'Inter',
                    //                   letterSpacing: 0,
                    //                 ),
                    //           ),
                    //         ),
                    //         Text(
                    //           "Bio of My App",
                    //           style: FlutterFlowTheme.of(context)
                    //               .labelLarge
                    //               .override(
                    //                 fontFamily: 'Inter',
                    //                 letterSpacing: 0,
                    //                 lineHeight: 1.4,
                    //               ),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
