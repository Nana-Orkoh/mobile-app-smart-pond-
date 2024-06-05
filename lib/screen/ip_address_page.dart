import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_automation_app/services/services_class.dart';

class IpAddressPage extends StatefulWidget {
  @override
  _IpAddressPageState createState() => _IpAddressPageState();
}

class _IpAddressPageState extends State<IpAddressPage> {
  // Form Controller
  final TextEditingController ipAddressTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    ipAddressTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Creating instance of the service class
    Services appService = Services();

    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            title: Text("Self Driving Card",
                style: GoogleFonts.aclonica(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)))),
        body: SafeArea(
            child: Container(
          color: Colors.black,
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  child: Column(children: [
                TextFormField(
                  controller: ipAddressTextController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      hintText: 'Enter IP Address'),
                )
              ])),
            ),
            SizedBox(height: 30),
            ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: deviceSize.width * 0.9, height: 50),
                child: ElevatedButton(
                    onPressed: () async{
                      final String address = ipAddressTextController.text;
                      await appService.saveAddressFunction(address);
                    },
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
                    child: Text('Connect to Address',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))))
          ]),
        )));
  }
}
