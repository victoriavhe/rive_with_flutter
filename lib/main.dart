import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _animationName;
  TextEditingController _squirrelController;

  @override
  void initState() {
    _animationName = "idle";
    _squirrelController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 300,
                        color: Color.fromRGBO(93, 142, 155, 1.0),
                        child: FlareActor(
                          "rive/squirrel.flr",
                          animation: _animationName,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Form(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "What is your email address...",
                                      labelText: "Email",
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _animationName = "writing";
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Try Peanuts...",
                                      labelText: "Password",
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _animationName = "password";
                                      });
                                    },
                                    controller: _squirrelController,
                                    onEditingComplete: () {

                                    },
                                    obscureText: true,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color.fromRGBO(160, 92, 147, 1.0),
                                          Color.fromRGBO(115, 82, 135, 1.0)
                                        ],
                                      )),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {
                                          if (_squirrelController.text.toString() ==
                                              "peanuts") {
                                            setState(() {
                                              _animationName = "correct";
                                            });
                                          }
                                        },
                                        child: Center(
                                          child: Text("Sign In",
                                              style: TextStyle(
                                                  fontFamily: "RobotoMedium",
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                        )),
                                  ),
                                )
                              ],
                            )),
                          )),
                    ])),
          ),
        ],
      ),
    );
  }
}
