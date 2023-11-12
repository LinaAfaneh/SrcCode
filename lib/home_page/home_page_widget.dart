import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../account_page/account_page_widget.dart';
import '../auth/auth_util.dart';
import '../category_bank/category_bank_widget.dart';
import '../category_clinics/category_clinics_widget.dart';
import '../category_gov/category_gov_widget.dart';
import '../contact_us/contact_us_widget.dart';
import '../flutter_color/flutter_color_icon_button.dart';
import '../flutter_color/flutter_color_theme.dart';
import '../flutter_color/flutter_color_util.dart';
import '../ubout_us/ubout_us_widget.dart';

UserName() {
  var UserEmail = currentUserEmail.toString();
  var splitt = UserEmail.split("@");
  splitt.remove(splitt[1]);
  splitt.insert(0, "Hi");
  var Name = splitt.toString();
  var FN = (Name.substring(1, Name.length - 1));
  return FN;
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomeNewWidgetState createState() => _HomeNewWidgetState();
}

class _HomeNewWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.format_list_bulleted,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 27,
              ),
              onPressed: () async {
                scaffoldKey.currentState.openDrawer();
              },
            ),
          ),
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.zero, bottom: Radius.circular(350))),
          flexibleSpace: Container(
            decoration: const ShapeDecoration(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.zero, bottom: Radius.circular(350)),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Color.fromARGB(255, 20, 17, 166),
                    Color.fromARGB(255, 23, 154, 169),
                  ],
                )),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 20, 25, 0),
                    child: Image.asset(
                      'assets/images/234.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 30, 0),
                  child: Text(
                    '',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 20,
                        ),
                  ),
                ),
              ],
            ),
          ),
          elevation: 2,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 350,
          height: 800,
          decoration: BoxDecoration(
            color: Color(0x4E008BD4),
          ),
          alignment:
              AlignmentDirectional(0.3999999999999999, -0.09999999999999998),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Image.asset(
                  'assets/images/234.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 50, 5, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: UboutUsWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'About Us',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 19,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xF33994D2),
                      dense: false,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(30, 0, 20, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(65),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 50, 5, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: ContactUsWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Contact Us',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 19,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xF33994D2),
                      dense: false,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(30, 0, 20, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(65),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 50, 5, 0),
                  child: InkWell(
                    onTap: () async {
                      await signOut();
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: AccountPageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Log-out',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 19,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xF33994D2),
                      dense: false,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(30, 0, 20, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(65),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: 375,
            height: 812,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 50,
                    left: -10.231555938720703,
                    right: 20,
                    child: Transform.rotate(
                      angle: 15.000000283105564 * (math.pi / 180),
                      child: Container(
                          width: 300,
                          height: 510,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Color.fromRGBO(
                                156, 226, 234, 0.8100000023841858),
                          )),
                    )),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 10, 0, 0),
                        child: Text(
                          ' ${UserName()} ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                        child: Text(
                          'Banks',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 3, 20, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: CategoryBankWidget(),
                              ),
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 230,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xE61254B7),
                                  width: 7,
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/9d5ecb84f304259ddb8bef7217a5e5dd.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(120, 17, 0, 0),
                        child: Text(
                          'Clinics',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(120, 3, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: CategoryClinicsWidget(),
                              ),
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 230,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xE61254B7),
                                  width: 7,
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/15385424_690152154496629_244769606810359070_o.jpg',
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(35, 25, 0, 0),
                        child: Text(
                          'Govermental Departments',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 3, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: CategoryGovWidget(),
                              ),
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 230,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: Image.asset(
                                    'assets/images/Jordan_coat_of_arms.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xE61254B7),
                                  width: 7,
                                ),
                              ),
                            ),
                          ),
                        ),
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
}
