import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String email;
  const MainScreen({Key key,this.email}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState(email);
}

class _MainScreenState extends State<MainScreen> { 
 List<Widget> tabs;
 int currentTabIndex = 0;
 _MainScreenState(this.email);
 final String email;

 @override
  void initState() {
    super.initState();
  }

  String $pagetitle = "MyExpress Driver";

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyExpress Driver'),
        backgroundColor: Colors.blueGrey,
    ),
    body: new Container(
      padding: EdgeInsets.all(18.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text('Hi, $email !',style: TextStyle(fontSize: 18.0),),  
        ],
      )
    ),
      
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: currentTabIndex,
        backgroundColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: Color.fromARGB(255, 0, 0, 0)),
            title: Text("PickUp"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event,color: Color.fromARGB(255, 0, 0, 0)),
            title: Text("My PickUp"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail,color: Color.fromARGB(255, 0, 0, 0)),
            title: Text("Messages"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Color.fromARGB(255, 0, 0, 0)),
            title: Text("Profile"),
          )
        ],
      ),
    );
  }
}