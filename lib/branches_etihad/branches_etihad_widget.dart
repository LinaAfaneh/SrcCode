import 'package:flutter/material.dart';

import '../flutter_color/flutter_color_theme.dart';
import '../flutter_color/flutter_color_util.dart';
import '../home_page/home_page_widget.dart';
import '../profile_etihad_bank1/profile_etihad_bank1_widget.dart';
import '../profile_etihad_bank2/profile_etihad_bank2_widget.dart';
import '../profile_etihad_bank3/profile_etihad_bank3_widget.dart';

class BranchesEtihadWidget extends StatefulWidget {
  const BranchesEtihadWidget({Key key}) : super(key: key);

  @override
  _BranchesEtihadWidgetState createState() => _BranchesEtihadWidgetState();
}

class _BranchesEtihadWidgetState extends State<BranchesEtihadWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
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
                  padding: EdgeInsetsDirectional.fromSTEB(25, 30, 25, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/images/la6oq_.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 30),
                  child: Text(
                    'Branches',
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
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 27,
              ),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 0),
                child: Container(
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Color(0xFF2E3839),
                      width: 2.55,
                    ),
                  ),
                  alignment: AlignmentDirectional(
                      0.19999999999999996, 0.050000000000000044),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: ProfileEtihadBank1Widget(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 22, 0, 5),
                          child: Image.asset(
                            'assets/images/la6oq_.png',
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Al-Rabieh',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                  ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.1, 0.2),
                          child: Text(
                            '      withdraw and deposit   \n   Amman - Jordan ',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 0),
                child: Container(
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Color(0xFF2E3839),
                      width: 2.55,
                    ),
                  ),
                  alignment: AlignmentDirectional(
                      0.19999999999999996, 0.050000000000000044),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: ProfileEtihadBank2Widget(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 22, 0, 5),
                          child: Image.asset(
                            'assets/images/la6oq_.png',
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Shmeisani',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                  ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.1, 0.2),
                          child: Text(
                            '      withdraw and deposit   \n   Amman - Jordan ',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 0),
                child: Container(
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Color(0xFF2E3839),
                      width: 2.55,
                    ),
                  ),
                  alignment: AlignmentDirectional(
                      0.19999999999999996, 0.050000000000000044),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: ProfileEtihadBank3Widget(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 22, 0, 5),
                          child: Image.asset(
                            'assets/images/la6oq_.png',
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Al - Saadeh St',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                  ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.1, 0.2),
                          child: Text(
                            '      withdraw and deposit   \n   Al-Zarqa\'a - Jordan ',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ),
                      ],
                    ),
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
