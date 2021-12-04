import 'dart:convert';
import 'package:bus_pe/ticket_page/ticket_page_widget.dart';

import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

String dropDown1Value;
String dropDown2Value;
String secretMessage;
String PaymentUId;
  BuildContext contextnew;
  
class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({Key key}) : super(key: key);

  @override
  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> {
  //Razorpay
  Razorpay razorpay;

  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.textColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(80, 87, 0, 0),
                child: Text(
                  'Welcome to BMTC',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.darkBackground,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              'You\'re on Bus',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.darkBackground,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              '400D',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.darkBackground,
                fontSize: 36,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.8, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Text(
                'Boarding Bus Stop',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.darkBackground,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.85, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: FlutterFlowDropDown(
                initialOption: dropDown1Value ??= 'K R Puram',
                options: functions.getRoute().toList(),
                onChanged: (val) => setState(() => dropDown1Value = val),
                width: 180,
                height: 50,
                textStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                elevation: 2,
                borderColor: Colors.transparent,
                borderWidth: 0,
                borderRadius: 0,
                margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.8, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
              child: Text(
                'Destination Bus Stop',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.darkBackground,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.85, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: FlutterFlowDropDown(
                initialOption: dropDown2Value ??= 'Yelahanka',
                options: functions.getRoute().toList(),
                onChanged: (val) => setState(() => dropDown2Value = val),
                width: 180,
                height: 50,
                textStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                elevation: 2,
                borderColor: Colors.transparent,
                borderWidth: 0,
                borderRadius: 0,
                margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              functions
                  .getPrice(dropDown1Value, dropDown2Value)
                  .toString()
                  .toString(),
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                fontSize: 25,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.05, -0.35),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await openCheckout();
                  contextnew = context;
                  
                },
                text: 'Proceed to Pay',
                options: FFButtonOptions(
                  width: 350,
                  height: 40,
                  color: FlutterFlowTheme.darkBackground,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
                loading: _loadingButton,
              ),
            ),
          ),
           Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TicketPageWidget()),
  );
                  
                },
                text: 'Show Ticket',
                options: FFButtonOptions(
                  width: 250,
                  height: 40,
                  color: FlutterFlowTheme.darkBackground,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
                loading: _loadingButton,
              ),
            ),
        ],
      ),
    );
  }
}

void openCheckout() {
  var amount =
      functions.getPrice(dropDown1Value, dropDown2Value).toString().toString();
  var amountint = int.parse(amount);
  var options = {
    "key": "rzp_test_pAHyhdxk2btam4",
    "amount": amountint *
        100, // Need to get price from fair funtion as global variable
    "name": "Payment For BusPe",
    "description": "This is a Test Payment",
    "timeout": "180",
    "theme.color": "#03be03",
    "currency": "INR",
    "prefill": {"contact": "8938499034", "email": "test@hypersync.com"},
    "external": {
      "wallets": ["paytm"]
    }
  };

  try {
    var razorpay = new Razorpay();
    razorpay.open(options);
  } catch (e) {
    print(e.toString());
  }
}

void handlerPaymentSuccess(PaymentSuccessResponse response) {
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //Open Confirmation Page( ticket_page.dart )
  //Store the order ID as a global variable
  // secretMessage = response.orderId +
  PaymentUId = response.paymentId;
  var msg = "SUCCESS: " + response.paymentId;
  print(response.paymentId);
  showToast(msg);
  
}

void handlerErrorFailure(PaymentFailureResponse response) {
  var msg = "ERROR: " +
      response.code.toString() +
      " - " +
      jsonDecode(response.message)['error']['description'];
  showToast(msg);
}

void handlerExternalWallet(ExternalWalletResponse response) {
  var msg = "EXTERNAL_WALLET: " + response.walletName;
  showToast(msg);
}

showToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey.withOpacity(0.1),
    textColor: Colors.black54,
  );
}
