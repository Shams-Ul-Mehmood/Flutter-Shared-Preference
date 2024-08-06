import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

main()
{
  runApp( Shared_Preferences_App() );
}

class Shared_Preferences_App extends StatelessWidget
{
  @override
  Widget build(BuildContext buildContext)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shared Preference App",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      color: Colors.white,
      home: SharedPreference(),
    );
  }
}

class SharedPreference extends StatefulWidget
{
  @override
  State<SharedPreference> createState() => SharedPreferenceState();
}

class SharedPreferenceState extends State<SharedPreference>
{
  var userName = TextEditingController();
  static const String KEYNAME = "username";
  var setUserName = "No Value Saved";

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext buildContext)
  {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        primary: true,
        title: Text("Shared Preference App", style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white ),),
        titleSpacing: 8,
        centerTitle: true,
        elevation: 8,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    label: Text("Name"),
                    border: OutlineInputBorder(),
                  ),
                controller: userName,
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{
                var userName = TextEditingController().text.toString();
                var sharePreference = await SharedPreferences.getInstance();
                sharePreference.setString(KEYNAME, userName);

            }, child: Text("Save", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
            SizedBox(height: 10,),
            Text(setUserName),
          ],
        ),
      ),
    );
  }
  void getUserName() async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    var user_Name = sharedPreferences.getString(KEYNAME);
    // setUserName = user_Name!;
    // setUserName = user_Name.toString();
    // setUserName = user_Name != null ? user_Name : "No Value Saved";
    setUserName = user_Name ?? 'No Value Saved';
    setState(() { });
  }
}