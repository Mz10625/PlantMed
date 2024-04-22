
import 'package:plantmed/onboarding_slideshow_widget.dart';

// import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
import 'onboarding_splash_model.dart';
export 'onboarding_splash_model.dart';

class OnboardingSplashWidget extends StatefulWidget {
  const OnboardingSplashWidget({super.key});

  @override
  State<OnboardingSplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<OnboardingSplashWidget> {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());

    // logFirebaseEvent('screen_view', parameters: {'screen_name': 'Splash'});
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 201,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/splash_img.webp')
                          ),
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text:const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Plant',
                                style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black87,),
                              ),
                              TextSpan(
                                text: 'Med',
                                style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 135, 211, 85)),
                              )
                            ],
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        // logFirebaseEvent('SPLASH_PAGE_GET_STARTED_BTN_ON_TAP');
                        // logFirebaseEvent('Button_haptic_feedback');
                        HapticFeedback.lightImpact();
                        // logFirebaseEvent('Button_navigate_to');

                        // context.pushNamed('Onboarding_Slideshow');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const OnboardingSlideshowWidget()));
                      },
                      text: 'Get Started',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color.fromRGBO(0, 100, 0, 1.0),
                        textStyle: TextStyle(fontSize: 15, color: Colors.white),
                        elevation: 0,
                        borderSide:const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    // InkWell(
                    //   splashColor: Colors.transparent,
                    //   focusColor: Colors.transparent,
                    //   hoverColor: Colors.transparent,
                    //   highlightColor: Colors.transparent,
                    //   onTap: () async {
                    //     // logFirebaseEvent('SPLASH_PAGE_Column_9mc7ub12_ON_TAP');
                    //     // logFirebaseEvent('Column_navigate_to');
                    //
                    //     // context.pushNamed('SignIn');
                    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInWidget()));
                    //   },
                    // child: Column(
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Padding(
                    //       padding:
                    //           EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                    //       child: RichText(
                    //         textScaler: MediaQuery.of(context).textScaler,
                    //         text: const TextSpan(
                    //           children: [
                    //             TextSpan(
                    //               text: 'Already a member?  ',
                    //               style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                    //             ),
                    //             TextSpan(
                    //               text: 'Sign In',
                    //               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
                    //             )
                    //           ],
                    //           style: TextStyle(fontSize: 15),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
