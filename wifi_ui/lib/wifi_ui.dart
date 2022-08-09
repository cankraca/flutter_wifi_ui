import 'package:flutter/material.dart';

class WifiUI extends StatefulWidget {
  const WifiUI({Key? key}) : super(key: key);

  @override
  State<WifiUI> createState() => _WifiUIState();
}

class _WifiUIState extends State<WifiUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(
          Icons.keyboard_arrow_left_sharp,
          size: 35,
        ),
        title: Text("Wi-Fi"),
        actions: [
          Icon(Icons.qr_code_sharp),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: UIBody(),
    );
  }
}

class UIBody extends StatefulWidget {
  const UIBody({Key? key}) : super(key: key);

  @override
  State<UIBody> createState() => _UIBodyState();
}

class _UIBodyState extends State<UIBody> {
  bool switchList = false;
  TextEditingController t1 = TextEditingController();
  var listItems = [
    ListTile(
      leading: Icon(Icons.wifi_password_rounded),
      title: Text("Wifi_2"),
    ),
    ListTile(
      leading: Icon(Icons.wifi_password_rounded),
      title: Text("Wifi_3"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            onChanged: (_) {
              setState(() {
                switchList = !switchList;
              });
            },
            value: switchList,
            title: Text(
              switchList == true ? "On" : "Off",
              style: TextStyle(fontSize: 17),
            ),
            tileColor: Color(0xff2E2D2D),
            activeColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(17))),
          ),
          Visibility(
            visible: switchList,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Current network",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.wifi,
                    color: Colors.blue,
                  ),
                  tileColor: Color(0xff242323),
                  title: Text("Wifi_1"),
                  subtitle: Text("Connected"),
                  trailing: Icon(Icons.settings),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Available network",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff242323),
                      borderRadius: BorderRadius.all(Radius.circular(17))),
                  child: ListView.builder(
                    physics: ScrollPhysics(parent: null),
                    shrinkWrap: true,
                    itemCount: listItems.length,
                    itemBuilder: (context, index) {
                      return listItems[index];
                    },
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  label: Text(
                    "Add Network",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("Add"),
      onPressed: () {
        setState(() {
          listItems.add(new ListTile(
            leading: Icon(Icons.wifi_password_rounded),
            title: Text(t1.text),
          ));
          t1.clear();
          Navigator.of(context).pop();
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("New Wifi"),
      content: TextField(controller: t1),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
