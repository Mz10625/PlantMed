
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:plantmed/dashboard_widget.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => DashboardWidget(),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
        ),
      );
  }
}
