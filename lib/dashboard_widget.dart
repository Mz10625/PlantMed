import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantmed/api_calls.dart';
import 'package:plantmed/display_plant_data.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/getwidget.dart';
import 'dashboard_model.dart';
import 'gallery.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {

  const DashboardWidget({Key? key}) : super(key: key);
  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;
  late File _imageFile;
  var object_name;
  List list = [
    "Aloevera",
    "Amruthaballi",
    "Arali",
  ];
//Camera code
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) return ; // User canceled the operation

    setState(() {
      _imageFile = File(pickedImage.path); // Update the image file
    });

    // Read the image file as bytes
    // final Uint8List? bytes = await _imageFile.readAsBytes();
    // if (bytes == null) return;

    // Save the image to the gallery
    // final result = await ImageGallerySaver.saveImage(bytes);
    // if (result['isSuccess']) {
    //   print('Image saved to gallery successfully');
    // } else {
    //   print('Failed to save image to gallery');
    // }
  }


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _imageFile = File('') ;
    _model = createModel(context, () => DashboardModel());
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
      length: 2,
      child: LoaderOverlay(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Color.fromRGBO(0, 100, 0, 1.0),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom:
                Radius.circular(30), // Adjust the radius value for the curve
              ),
            ),
            title: const Text(
              "PlantMed",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            // actions: [
            //   IconButton(
            //     icon: Icon(
            //       Icons.search_rounded,
            //       size: 30,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {
            //       // Handle search action
            //     },
            //   ),
            // ],
          ),
          bottomNavigationBar: menu(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                          child: // Generated code for this Stack Widget...
                          Stack(
                            children: [
                              // TextField(
                              //   decoration: InputDecoration(
                              //     hintText: 'Search',
                              //     prefixIcon: Icon(Icons.search),
                              //   ),
                              //
                              // ),
                              GFSearchBar(
                                  searchList: list,
                                  searchQueryBuilder: (query, list) => list
                                      .where((item) {
                                    return item!.toString().toLowerCase().contains(query.toLowerCase());
                                  }).toList(),
                                  // searchBoxInputDecoration: InputDecoration(
                                  //   border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  //   hintText: "Search",
                                  //
                                  // ),
                                  overlaySearchListItemBuilder: (dynamic item) => Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  onItemSelected: (dynamic item) {
                                    setState(() {
                                      print('$item');
                                      Navigator.push(context, MaterialPageRoute(builder: (Context)=>RenderPlantData(item)));
                                  });
                              }),

                              // Image widget commented out for now
                              Align(
                                alignment: AlignmentDirectional(0, -0.55),
                                child: Container(
                                  width: double.infinity,
                                  height: 180,
                                  child: CarouselSlider(
                                    items: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/Sliding img1.jpg',
                                          width: 300,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/sliding2.jpg',
                                          width: 300,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/sliding3.jpg',
                                          width: 300,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/sliding4.webp',
                                          width: 300,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                    carouselController:
                                    _model.carouselController ??=
                                        CarouselController(),
                                    options: CarouselOptions(
                                      initialPage: 1,
                                      viewportFraction: 0.5,
                                      disableCenter: true,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.25,
                                      enableInfiniteScroll: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: true,
                                      onPageChanged: (index, _) =>
                                      _model.carouselCurrentIndex = index,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0.93, 0.46),
                                child: Container(
                                  width: 150,
                                  height: 100,
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: '',
                                    options: FFButtonOptions(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24),
                                      color: Color.fromRGBO(0, 100, 0, 1.0),
                                      textStyle: FlutterFlowTheme
                                          .of(context)
                                          .titleSmall
                                          .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                      elevation: 3,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.93, 0.46),
                                child: Container(
                                  width: 150,
                                  height: 100,
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: '',
                                    options: FFButtonOptions(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24),
                                      color: Color.fromRGBO(0, 100, 0, 1.0),
                                      textStyle: FlutterFlowTheme
                                          .of(context)
                                          .titleMedium
                                          .override(
                                        fontFamily: 'Playfair Display',
                                      ),
                                      elevation: 3,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0.70, 0.4),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => gallery()),
                                    );
                                  },
                                  child: Icon(
                                    Icons.image_search_sharp,
                                    color: Colors.white54,
                                    size: 60,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.69, 0.4),
                                child: InkWell(
                                  onTap: () async {
                                    await _pickImageFromCamera();
                                    if(_imageFile != null){
                                      if(await isConnected()){
                                        context.loaderOverlay.show();
                                        object_name = await get_image_class(_imageFile);
                                        context.loaderOverlay.hide();
                                        // print("Object name from camera = ${object_name}");
                                        if(object_name != "null" && object_name != "-1"){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RenderPlantData(object_name),));
                                        }
                                        else{
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Detection Failed"),
                                                content: Text("Make sure that you selected a valid Image."),
                                                actions: [
                                                  TextButton(
                                                    child: Text("OK"),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                             },
                                            );
                                          }
                                      }
                                      else{
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Connection Error"),
                                              content: Text("Please check your Internet Connection and try again"),
                                              actions: [
                                                TextButton(
                                                  child: Text("OK"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.camera_sharp,
                                    color: Colors.white54,
                                    size: 60,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.71, 0.51),
                                child: Text(
                                  'Camera',
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0.70, 0.51),
                                child: Text(
                                  'Gallery',
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                      ),
                                ),
                              ),
                            ],
                          )
                      ),
                      Container(
                          child:
                          Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.65, 0.52),
                                child: Text(
                                  'Camera',
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.72, 0.48),
                                child: Text(
                                  'Gallery',
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.42, -0.88),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: SvgPicture.asset(
                                    'assets/images/about-us.svg',
                                    width: 300,
                                    height: 215,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.02, 0.70),
                                child: Container(
                                  width: 350,
                                  height: 204,
                                  decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Text(
                                        'This app uses image processing techniques to identify Medicinal Herbs from images captured by the camera or uploaded image from gallery.Join us on a journey to unlock nature\'s healing power. Explore, discover, and harness the magic of medicinal plants with us today!',
                                        textAlign: TextAlign.justify,
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Open Sans',
                                          color: Colors.black45,
                                          fontSize: 14,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      // const Align(
                                      //   alignment: AlignmentDirectional(-0.85, 0.81),
                                      //   child: Icon(
                                      //     Icons.facebook_sharp,
                                      //     color: Colors.green,
                                      //     size: 24,
                                      //   ),
                                      // ),
                                      // const Align(
                                      //   alignment: AlignmentDirectional(-0.04, 0.81),
                                      //   child: Icon(
                                      //     Icons.phone_outlined,
                                      //     color: Colors.green,
                                      //     size: 24,
                                      //   ),
                                      // ),
                                      // const Align(
                                      //   alignment: AlignmentDirectional(0.86, 0.8),
                                      //   child: Icon(
                                      //     Icons.email,
                                      //     color: Colors.green,
                                      //     size: 24,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.13, -0.04),
                                child: RichText(
                                  textScaler: MediaQuery
                                      .of(context)
                                      .textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'About us ',
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Montserrat',
                                          color: Color.fromRGBO(0, 100, 0, 1.0),
                                          fontSize: 28,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' -Medicinal plant detection',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme
                                        .of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Color.fromARGB(153, 194, 255, 154),
      child: const TabBar(
        labelColor: Color.fromRGBO(0, 100, 0, 1.0),
        unselectedLabelColor: Color.fromARGB(249, 90, 90, 90),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Color.fromRGBO(0, 100, 0, 1.0),
        tabs: [
          Tab(
            text: "Scan",
            icon: Icon(Icons.camera_alt),
          ),
          Tab(
            text: "About Us",
            icon: Icon(Icons.question_mark_rounded),
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
