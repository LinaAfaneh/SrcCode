import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../flutter_color/flutter_color_theme.dart';
import '../flutter_color/flutter_color_util.dart';
import '../home_page/home_page_widget.dart';

DateQminder() {
  var now = new DateTime.now();
  var forma = DateFormat('yyyy-MM-dd');
  var three = forma.format(now);
  print(three);
  var dateCurr = three.toString();
  return dateCurr;
}

var count = 0;
CounterApi() async {
  var data = await QminderApi();
  var total = data['data'].length;
  count = 0;
  for (var i = 0; i < total; i++) {
    print(data['data'][i]['status']);
    print(data['data'][i]['firstName']);
    print(data['data'][i]['phoneNumber']);
    if (data['data'][i]['status'] == "NEW" ||
        data['data'][i]['status'] == "CALLED") {
      count += 1;
    }
  }
  return count;
}

totalVisitorQ() async {
  var x = await QminderApi();
  var totalV = x['data'].length;
  return totalV;
}

Diagram() async {
  var data = await DiagramTV();
  print(data);
  return data;
}

class ProfiledStatus1Widget extends StatefulWidget {
  const ProfiledStatus1Widget({Key key}) : super(key: key);

  @override
  _ProfiledStatus1WidgetState createState() => _ProfiledStatus1WidgetState();
}

class _ProfiledStatus1WidgetState extends State<ProfiledStatus1Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final phoneNum = '(06) 563 6666';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        Duration(seconds: 3),
        (a) => CounterApi(),
      ),
      builder: (ctx, sna) {
        var C = Future(() => CounterApi());
        var T = Future(() => totalVisitorQ());
        var D = Future(() => Diagram());
        return FutureBuilder(
          future: Future.wait([C, T, D]),
          // ignore: missing_return
          builder: (hh, snapShot) {
            if (snapShot.hasData) {
              List<BarChartModel> info = [
                BarChartModel(
                  day: "Sat",
                  total: int.parse(snapShot.data[2][0]),
                  color: setColor(int.parse(snapShot.data[2][0])),
                ),
                BarChartModel(
                  day: "Sun",
                  total: int.parse(snapShot.data[2][1]),
                  color: setColor(int.parse(snapShot.data[2][1])),
                ),
                BarChartModel(
                  day: "Mon",
                  total: int.parse(snapShot.data[2][2]),
                  color: setColor(int.parse(snapShot.data[2][2])),
                ),
                BarChartModel(
                  day: "Tue",
                  total: int.parse(snapShot.data[2][3]),
                  color: setColor(int.parse(snapShot.data[2][3])),
                ),
                BarChartModel(
                  day: "Wed",
                  total: int.parse(snapShot.data[2][4]),
                  color: setColor(int.parse(snapShot.data[2][4])),
                ),
                BarChartModel(
                  day: "Thu",
                  total: int.parse(snapShot.data[2][5]),
                  color: setColor(int.parse(snapShot.data[2][5])),
                ),
                BarChartModel(
                  day: "Fri",
                  total: int.parse(snapShot.data[2][6]),
                  color: setColor(int.parse(snapShot.data[2][6])),
                ),
              ];
              List<charts.Series<BarChartModel, String>> series = [
                charts.Series(
                  id: "Total Visitors",
                  data: info,
                  domainFn: (BarChartModel series, _) => series.day,
                  measureFn: (BarChartModel series, _) => series.total,
                  colorFn: (BarChartModel series, _) => series.color,
                  labelAccessorFn: (BarChartModel series, _) =>
                      series.total.toString(),
                ),
              ];
              return Scaffold(
                key: scaffoldKey,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(64),
                  child: AppBar(
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                            Color.fromARGB(255, 20, 17, 166),
                            Color.fromARGB(255, 23, 154, 169),
                          ])),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(30, 25, 30, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'assets/images/00.png',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Text(
                              ' Tla\'a Al Ali ',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 12,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    leading: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 3, 10, 0),
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 27,
                          ),
                        ),
                      ),
                    ],
                    elevation: 2,
                  ),
                ),
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 375,
                          height: 653.3,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/u17b6__.PNG',
                                  width: 375,
                                  height: 164,
                                  fit: BoxFit.fitWidth,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 10, 0, 0),
                                      child: Text(
                                          '  The government created the Civil\n  Status Department in order to carry\n  out the task of registering citizens,\n  instead of delegating this duty to\n  several ministries and official\n  departments. ',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              )),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 5),
                                            child: InkWell(
                                              onTap: () async {
                                                await launchURL(
                                                    'tel://$phoneNum');
                                              },
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFF4B39EF),
                                                  ),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Icon(
                                                  Icons.local_phone_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 5),
                                            child: InkWell(
                                              onTap: () async {
                                                await launchURL(
                                                    'http://cspd.gov.jo//');
                                              },
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFF4B39EF),
                                                  ),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Icon(
                                                  Icons.link_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await launchURL(
                                                    'https://maps.app.goo.gl/MtqmYtrv9i8cQiyu5');
                                              },
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFF4B39EF),
                                                  ),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 30, 0, 0),
                                      child: Text(
                                        'Live : ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.08, 0.57),
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/user.png',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.06, 0.71),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 3, 0),
                                            child: Text(
                                              '${snapShot.data[0]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 30,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 20),
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 30, 0),
                                          child: Text(
                                            ' Waiting time (each person) : 30 min ',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 70, 0),
                                          child: Text(
                                            //  'Estimate waiting time : ${snapShot.data[0] * 30} min',
                                            'Estimate waiting time : ${calMin(snapShot.data[0])} min',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 15, 150, 0),
                                          child: Text(
                                            'Total visitor today : ${snapShot.data[1]}',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 260, 0),
                                  child: Text(
                                    ' Review:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: charts.BarChart(
                                    series,
                                    animate: true,
                                    barRendererDecorator:
                                        new charts.BarLabelDecorator(
                                            outsideLabelStyleSpec:
                                                new charts.TextStyleSpec()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapShot.connectionState == ConnectionState.waiting) {
              return Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                  ));
            }
          },
        );
      },
    );
  }
}

Future<dynamic> QminderApi() async {
  var headers = {
    'X-Qminder-REST-API-Key': '9Yu5jikK2lCKUQTaEg8o5rM0B69Q3yJdCm6AF6c9',
  };
  var why = DateQminder().toString();
  var url = Uri.parse(
      'https://api.qminder.com/v1/tickets/search?minCreated=${why}T01:00:00Z&location=43175');
  var res = await http.get(url, headers: headers);
  if (res.statusCode == 200) {
    var tickets = json.decode(res.body);
    (tickets as Map<String, dynamic>).length;
    return tickets;
  } else {
    throw Exception('error!');
  }
}

var maxi;

Future<dynamic> DiagramTV() async {
  var url =
      Uri.parse('https://visiondb.000webhostapp.com/Places/getStatus1.php');
  http.Response res = await http.get(url);
  var TotalVisitors = res.body.toString();
  List<String> TV = TotalVisitors.split("-");
  List<int> num = TV.map(int.parse).toList();
  print(num);
  maxi = num.reduce(max);
  print(TV);
  return TV;
}

class BarChartModel {
  String day;
  dynamic total;
  final charts.Color color;

  BarChartModel({
    this.day,
    this.total,
    this.color,
  });
}

setColor(totall) {
  //var Dman=double.parse(maxi);
  if (totall == maxi) {
    return charts.ColorUtil.fromDartColor(Colors.red);
  } else {
    return charts.ColorUtil.fromDartColor(Colors.blueGrey);
  }
}

min(hourCount) {
  var x = hourCount;
  if (x <= 59) {
    return hourCount;
  } else {
    return x / 60;
  }
}

calMin(var vis) {
  var ed = vis * 30;

  var m = (ed % 60).toString();

  if (ed > 61) {
    var h = ((ed / 60).toInt()).toString();
    String waiting = "$h:$m";
    return waiting;
  } else if (ed == 60) {
    var h = 1.toString();
    String waiting = "$h:0$m";
    return waiting;
  } else {
    var h = 0.toString();
    String waiting = "$h:$m";
    return waiting;
  }
}
