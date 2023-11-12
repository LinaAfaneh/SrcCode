import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new1/profile_arab_bank1/profile_arab_bank1_widget.dart'
    as Khilda;
import 'package:new1/profile_arab_bank2/profile_arab_bank2_widget.dart'
    as Abdun;
import 'package:new1/profile_arab_bank3/profile_arab_bank3_widget.dart'
    as NewZarqa;
import 'package:new1/profile_driver1/profile_driver1_widget.dart'
    as MarjAlHamam;
import 'package:new1/profile_etihad_bank1/profile_etihad_bank1_widget.dart'
    as AlRabieh;
import 'package:new1/profile_etihad_bank2/profile_etihad_bank2_widget.dart'
    as AlShmeisani;
import 'package:new1/profile_etihad_bank3/profile_etihad_bank3_widget.dart'
    as AlSaadeh;
import 'package:new1/profile_hospital_j_u1/profile_hospital_j_u1_widget.dart'
    as DrFarihan;
import 'package:new1/profile_hospital_j_u2/profile_hospital_j_u2_widget.dart'
    as DrOmar;
import 'package:new1/profile_hospital_j_u3/profile_hospital_j_u3_widget.dart'
    as ProfAbdulManaf;
import 'package:new1/profiled_custom/profiled_custom_widget.dart' as Abdali;
import 'package:new1/profiled_driver2/profiled_driver2_widget.dart' as MakkahSt;
import 'package:new1/profiled_status1/profiled_status1_widget.dart'
    as TlaaAlAli;
import 'package:new1/profiled_status2/profiled_status2_widget.dart'
    as HayMasoum;

import '../account_page/account_page_widget.dart';
import '../auth/auth_util.dart';
import '../flutter_color/flutter_color_icon_button.dart';
import '../flutter_color/flutter_color_theme.dart';
import '../flutter_color/flutter_color_util.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post_Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostD(),
    );
  }
}

class PostD extends StatefulWidget {
  @override
  State<PostD> createState() => _PD();
}

class _PD extends State<PostD> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var feed = " ";
  feedback() {
    setState(() {
      if (currTime() != null) {
        print("Successfully added");
        feed = "Successfully added";
      } else {
        print("Did not ");
        feed = "Did not ";
      }
    });
  }

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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Image.asset(
                    'assets/images/234.png',
                    width: 340,
                    height: 150,
                    fit: BoxFit.contain,
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
            child: Column(children: [
          Text(
            '\n     Add Total Visitors to Database\n\n',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            '$feed',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            '\n\n\n\n\n\n\n\n\n\n\n\nPush The Button ---->',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ])),
        floatingActionButton: FloatingActionButton(
            onPressed: feedback,
            tooltip: 'Add to database',
            backgroundColor: Color(0xFF77B0B7)));
  }
}

var kh = Khilda.totalVisitorQ();
var ab = Abdun.totalVisitorQ();
var nz = NewZarqa.totalVisitorQ();
var ar = AlRabieh.totalVisitorQ();
var ash = AlShmeisani.totalVisitorQ();
var asa = AlSaadeh.totalVisitorQ();
var df = DrFarihan.totalVisitorQ();
var dom = DrOmar.totalVisitorQ();
var pf = ProfAbdulManaf.totalVisitorQ();
var mk = MakkahSt.totalVisitorQ();
var mh = MarjAlHamam.totalVisitorQ();
var hm = HayMasoum.totalVisitorQ();
var ta = TlaaAlAli.totalVisitorQ();
var bi = Abdali.totalVisitorQ();
var day = days();

var x = 100; // 3 post fun
Future<List> senddata() async {
  var url = Uri.parse("https://visiondb.000webhostapp.com/TotalInsert.php");
  var response = await http.post(url, body: {
    'Khilda': '$kh',
    'Abdun': '$ab',
    'NewZarqa': '$nz',
    'AlRabieh': '$ar',
    'AlShmeisani': '$ash',
    'AlSaadeh': '$asa',
    'DrFarihan': '$df',
    'DrOmar': '$dom',
    'ProfAbdulManaf': '$pf',
    'MakkahSt': '$mk',
    'MarjAlHamam': '$mh',
    'HayMasoum': '$hm',
    'TlaaAlAli': '$ta',
    'Abdali': '$bi'
  });
  print(response.body);
}

currTime() {
  DateTime now = DateTime.now();
  var CH = now.hour.toString();
  print(CH);
  if (CH == '21' || CH == '22' || CH == '23') {
    return senddata();
  }
}

days() {
  DateTime now = new DateTime.now();
  String x = DateFormat('EEEE').format(now);
  return x;
}
