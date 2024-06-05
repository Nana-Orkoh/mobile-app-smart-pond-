import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_automation_app/services/services_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String iPaddress;
  getIpAddressFunction() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String initIpAddress = prefs.getString('ip_address');
    setState(() {
      iPaddress = initIpAddress;
    });
  }

  // Bulb controller
  bool bulbController = false;
// Fan Controller
  bool fanController = false;
  // Tv Controller
  bool tvController = false;

  bool autoController = false;
  // MODE CONTROLLER
  bool appMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIpAddressFunction();
  }

  @override
  Widget build(BuildContext context) {
    // Creating instance of the services class
    Services appServices = Services();

    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text("Self Driving Car",
              style: GoogleFonts.aclonica(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.bottomSheet(Container(
                      height: 50,
                      color: Colors.white,
                      child: Column(children: [
                        TextButton(
                          child: Text("SWITCH MODE",
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.blue)),
                          onPressed: () {
                            if (appMode == false) {
                              setState(() {
                                appMode = true;
                              });
                              appServices.automaticMode("ON");
                            } else {
                              setState(() {
                                appMode = false;
                              });
                              appServices.automaticMode("OFF");
                            }
                          },
                        ),
                      ]),
                    ));
                  },
                  child: Row(


                  ),
                )
              ],
            ),
          ],
        ),
        body: SafeArea(
            child: Container(
          color: Colors.black,
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(children: [
            SizedBox(height: 20),
            // First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Fan Controller - Btn
                GestureDetector(
                  onTap: () {
                    if (appMode == false) {
                      setState(() {
                        if (fanController == true) {
                          fanController = false;
                          appServices.fanServiceFunction("OFF");
                        } else {
                          fanController = true;
                          bulbController = false;
                          tvController=false;
                          autoController = false;
                          appServices.fanServiceFunction("ON");
                        }
                      });
                    } else {
                      return null;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      color: Colors.yellow[800],
                    ),
                    width: deviceSize.width * 0.4,
                    height: 160,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: appMode == false
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.circle,
                                      color: fanController == true
                                          ? Colors.red
                                          : Colors.white,
                                      size: 35),
                                  Text("Reservoir Pump",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                  Text(fanController == true ? "ON" : "OFF",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white))
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                    Center(
                                      child: FaIcon(FontAwesomeIcons.circle,
                                          color: Colors.white, size: 35),
                                    ),
                                    Text("""AUTO MODE""",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ])),
                  ),
                ),
                // Bulb Controller - Btn
                GestureDetector(
                  onTap: () {
                    if (appMode == false) {
                      setState(() {
                        if (bulbController == true) {
                          bulbController = false;
                          // Bulb Service
                          appServices.bulbServiceFunction("OFF");
                        } else {
                          appServices.bulbServiceFunction("ON");
                          bulbController = true;
                          fanController = false;
                          tvController=false;
                          autoController = false;
                        }
                      });
                    } else {
                      return null;
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: Colors.blue[600],
                      ),
                      width: deviceSize.width * 0.4,
                      height: 160,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: appMode == false
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.lightbulb_outline,
                                        color: bulbController == true
                                            ? Colors.red
                                            : Colors.white,
                                        size: 35),
                                    Text("Pond Pump",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                    Text(bulbController == true ? "ON" : "OFF",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white))
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                      Center(
                                        child: Icon(Icons.circle,
                                            color: Colors.white, size: 35),
                                      ),
                                      Text("""AUTO MODE""",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white)),
                                    ]))),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Tv Controller - Btn
                GestureDetector(
                  onTap: () {
                    if (appMode == false) {
                      setState(() {
                        if (tvController == true) {
                          tvController = false;
                          appServices.tvServiceFunction("OFF");
                        } else {
                          tvController = true;
                          bulbController = false;
                          fanController=false;
                          autoController=false;
                          appServices.tvServiceFunction("ON");
                        }
                      });
                      // ===========================
                      
                      // setState(() {
                      //   Get.snackbar(
                      //     "Television not found",
                      //     "No Television is connected. Please check and try again",
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     colorText: Colors.black,
                      //     backgroundColor: Colors.white,
                      //   );
                      // });

                    } else {
                      return null;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      color: Colors.purple[700],
                    ),
                    width: deviceSize.width * 0.4,
                    height: 160,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: appMode == false
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.circle,
                                      color: Colors.white, size: 35),
                                  Text("All Pumps",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                  Text(tvController==false?"OFF":"ON",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white))
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                    Center(
                                      child: FaIcon(FontAwesomeIcons.circle,
                                          color: Colors.white, size: 35),
                                    ),
                                    Text("""AUTO MODE""",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ])),
                  ),
                ),





                // Bulb Controller - Btn
                GestureDetector(
                  onTap: () {
                    if (appMode == false) {
                      setState(() {
                        if (autoController == true) {
                          autoController = false;
                          // Bulb Service
                          appServices.autoServiceFunction("OFF");
                        } else {
                          appServices.autoServiceFunction("ON");
                          autoController = true;
                          fanController = false;
                          tvController=false;
                          bulbController =false;
                        }
                      });
                    } else {
                      return null;
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: Colors.blue[600],
                      ),
                      width: deviceSize.width * 0.4,
                      height: 160,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: appMode == false
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.lightbulb_outline,
                                  color: autoController == true
                                      ? Colors.red
                                      : Colors.white,
                                  size: 35),
                              Text("AUTOMATE SYSTEM",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                              Text(autoController == true ? "ON" : "OFF",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white))
                            ],
                          )
                              : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Icon(Icons.lightbulb_outline,
                                      color: Colors.white, size: 35),
                                ),
                                Text("""AUTO MODE""",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              ]))),
                ),





              ],
            ),
            SizedBox(height: 30),
            ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: deviceSize.width * 0.9, height: 50),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green[600]),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ))),
                    child: Text('IP:$iPaddress',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))))
          ]),
        )));
  }
}
