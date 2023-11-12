import 'package:flutter/material.dart';

import '../account_page/account_page_widget.dart';
import '../auth/auth_util.dart';
import '../contact_us/contact_us_widget.dart';
import '../flutter_color/flutter_color_icon_button.dart';
import '../flutter_color/flutter_color_theme.dart';
import '../flutter_color/flutter_color_util.dart';
import '../home_page/home_page_widget.dart';

class UboutUsWidget extends StatefulWidget {
  const UboutUsWidget({Key key}) : super(key: key);

  @override
  _UboutUsWidgetState createState() => _UboutUsWidgetState();
}

class _UboutUsWidgetState extends State<UboutUsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(27, 30, 25, 0),
                  child: Image.asset(
                    'assets/images/234.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: HomePageWidget(),
                    ),
                  );
                },
                child: Icon(
                  Icons.home_sharp,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 27,
                ),
              ),
            ),
          ],
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 240, 0),
                child: Text(
                  'About Us',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Divider(
                thickness: 3,
                indent: 20,
                endIndent: 200,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Text(
                  ' A user friendly application that shows the number of people in selected places in order to reduce users time, effort and help increasing regulation especially in governmental departments .',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
