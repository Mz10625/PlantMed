// import '/auth/firebase_auth/auth_util.dart';
// import '/backend/backend.dart';
import 'package:plantmed/profile_widget.dart';
import 'package:plantmed/sign_in_widget.dart';

import '/empty_state_widget.dart';
import '/meal_card_widget.dart';
import '/meal_card_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:image_picker/image_picker.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'image_io.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    // // On page load action.
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   logFirebaseEvent('DASHBOARD_PAGE_Dashboard_ON_INIT_STATE');
    //   logFirebaseEvent('Dashboard_haptic_feedback');
    //   HapticFeedback.mediumImpact();
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor:Color.fromRGBO(0, 100, 0, 1.0),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30), // Adjust the radius value for the curve
            ),
          ),

          title:const Text("PlantMed",style:TextStyle(fontFamily: 'Montserrat',color: Colors.white,fontWeight:FontWeight.bold),),
          actions: [
            IconButton(
              onPressed: () {
                // Add your button's onPressed logic here
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInWidget()));
              },
              icon: const Icon(Icons.logout_rounded, color: Colors.white,size: 40,),
            ),
          ],
        ),

        bottomNavigationBar: menu(),
        body: TabBarView(
                children: [
                  Container(child: // Generated code for this Stack Widget...
                  Stack(
                    children: [
                      // Align(
                      //   alignment: AlignmentDirectional(0, 0),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(8),
                      //     child: Image.network(
                      //       '',
                      //       width: 412,
                      //       height: 289,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: AlignmentDirectional(-0.08, -0.56),
                        child: FFButtonWidget(
                          onPressed: () async {
                            print('Button pressed ...');
                            getImage();
                          },
                          text: '',
                          options: FFButtonOptions(
                            width: 200,
                            height: 100,
                            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color:Color.fromRGBO(0, 100, 0, 1.0),
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              letterSpacing: 0,
                            ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.03, 0.14),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: '',
                          options: FFButtonOptions(
                            width: 200,
                            height: 100,
                            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: Color.fromRGBO(0, 100, 0, 1.0),
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              letterSpacing: 0,
                            ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.05, -0.53),
                        child: Icon(
                          Icons.image_search_sharp,
                          color: Colors.white70,
                          size: 60,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.05, 0.13),
                        child: Icon(
                          Icons.camera_sharp,
                          color: Colors.white70,
                          size: 60,
                        ),
                      ),
                    ],
                  )
                  ),
                  Container(child: Icon(Icons.directions_transit)),
                  Container(child: Icon(Icons.directions_bike)),
                ],
              ),
      ),
    );
  }
  Future getImage() async {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    
      // setState(() {
      //   _image = image;
      // });
  }
  Widget menu() {
    return Container(
      color:Color.fromARGB(153, 194, 255, 154),
      child:const TabBar(
        labelColor:Color.fromRGBO(0, 100, 0, 1.0),
        unselectedLabelColor: Color.fromARGB(249, 90, 90, 90),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor:Color.fromRGBO(0, 100, 0, 1.0),
        tabs: [
          Tab(
            text: "Scan",
            icon: Icon(Icons.camera_alt),
          ),
          Tab(
            text: "Profile",
            icon: Icon(Icons.person),
          ),
          Tab(
            text: "About Us",
            icon: Icon(Icons.question_mark_outlined),
          ),
        ],
      ),
    );
  }
}


/*

GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This week\'s meals',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                      child: Text(
                        'Made to order with fresh ingredients each week.',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(14),
                  // child: AuthUserStreamWidget(
                  //   builder: (context) => StreamBuilder<List<MealsRecord>>(
                  //     stream: queryMealsRecord(
                  //       queryBuilder: (mealsRecord) => mealsRecord.where(
                  //         'meal_diet',
                  //         arrayContains:
                  //             valueOrDefault(currentUserDocument?.diet, ''),
                  //       ),
                  //     ),
                  //     builder: (context, snapshot) {
                  //       // Customize what your widget looks like when it's loading.
                  //       if (!snapshot.hasData) {
                  //         return MealCardLoadingWidget();
                  //       }
                  //       List<MealsRecord> gridViewMealsRecordList =
                  //           snapshot.data!;
                  //       if (gridViewMealsRecordList.isEmpty) {
                  //         return Container(
                  //           width: double.infinity,
                  //           child: EmptyStateWidget(
                  //             icon: Icon(
                  //               Icons.no_food_outlined,
                  //               color:
                  //                   FlutterFlowTheme.of(context).secondaryText,
                  //               size: 64,
                  //             ),
                  //             title: 'No Meals',
                  //             description:
                  //                 'No meals have been created or match your dietary preferences.',
                  //           ),
                  //         );
                  //       }
                  //       return GridView.builder(
                  //         padding: EdgeInsets.zero,
                  //         gridDelegate:
                  //             SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           crossAxisSpacing: 10,
                  //           mainAxisSpacing: 10,
                  //           childAspectRatio: 0.78,
                  //         ),
                  //         scrollDirection: Axis.vertical,
                  //         itemCount: gridViewMealsRecordList.length,
                  //         itemBuilder: (context, gridViewIndex) {
                  //           final gridViewMealsRecord =
                  //               gridViewMealsRecordList[gridViewIndex];
                  //           return MealCardWidget(
                  //             key: Key(
                  //                 'Keykia_${gridViewIndex}_of_${gridViewMealsRecordList.length}'),
                  //             mealRef: gridViewMealsRecord,
                  //           );
                  //         },
                  //       );
                  //     },
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_4x4), label: "Scan"
            ),

            BottomNavigationBarItem(
              icon: IconButton(
                icon : Icon(Icons.person),
                onPressed: ()=>{
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProfileWidget()))
                },
              ),
              label: "Profile"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.question_mark), label: "About")
          ]),
      ),
    );

*/