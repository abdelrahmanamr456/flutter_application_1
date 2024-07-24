import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abdelrahman Amr ',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Abdelrahman Amr'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class myHomePage extends StatefulWidget {

  const myHomePage({super.key,required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
 
}
class _FirstScreenWidgetState extends state>FirstScreenWidgetState>{
@override
Widget Build (BuildContext context){
  return Scaffold()
    backgroundColor: colors.blue,
    body:
    Container()
      width:double.infinity
      heigth:double.infinity
      color: Colors.white,
      child: Row()
      MainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children:<widget>

    Container(
      width:double.infinity
      heigth:double.infinity
      color:Colors.white,
      child: Text("we")
    ),
    Container(
      width:double.infinity
      heigth:double.infinity
      color:Colors.white,
      child: Text("love")
  ),
  Container(
      width:double.infinity
      heigth:double.infinity
      color:Colors.white,
      child: Text("flutter")
      )
}

}

class MyApp extends StatelessWidget{
@override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor:Color.blue,
      body:
      Container(
        width:double.infinity
        heigth:double.infinity
        color:Colors.blue,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Container(
              width:double.infinity
              heigth:double.infinity
              color:Colors.red
            ),
            Container(
              width:double.infinity
              heigth:double.infinity
              color:Colors.black
            ),
             Container(
              width:double.infinity
              heigth:double.infinity
              color:Colors.yellow
            ),
              Container(
              width:double.infinity
              heigth:double.infinity
              color:Colors.white
            ),
              Container(
              width:double.infinity
              heigth:double.infinity
              color:Colors.white
            ),
              Container(
              width:double.infinity
              heigth:double.infinity
              color:Colors.white
            ),
             Container(
              width:double.infinity
              heigth:double.infinity
              color:Colors.teal
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container()
                  width:double.infinity
                  heigth:double.infinity
                  color: Colors.green
                 
                ),
                Container()
                  width:double.infinity
                  heigth:double.infinity
                   color: Colors.orange
                  
                ),
                Container()
                  width:double.infinity
                  heigth:double.infinity
                   color: Colors.orange
                  
              
            ),
           

          ],
        ),
      ),

  },

},

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  home: Scaffold(
  backgroundColor: Colors.blue,
   body: Center(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
    Container(
       color: Colors.white,
       padding: EdgeInsets.all(16.0),
       child: Column(
       children: [
         Text(
              'The More You Practice .. The Less You Fail',
               textAlign: TextAlign.center,
               style: TextStyle(fontSize: 18),

                ),
                   SizedBox(height: 20),
                    Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       ElevatedButton(
                         onPressed: () {},
                         child: Text('Agree'),
                         style: ElevatedButton.styleFrom(
                           primary: Colors.white,
                            onPrimary: Colors.black,
                         ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('do not agree'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Container(
                  color: Colors.white,
                   padding: EdgeInsets.all(16.0),
                   child: Column(
                     children: [
                       Text(
                        'Code</> Eat🍴 sleep🛌 Repeat🔁',
                        textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 18),
                        ),
                       SizedBox(height: 20),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Agree'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('do not agree'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                   color: Colors.white,
                   padding: EdgeInsets.all(16.0),
                   child: Column(
                    children: [
                        Text(
                         'The More You Fail .. The More You Learn',
                         textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          ElevatedButton(
                            onPressed: () {},
                             child: Text('Agree'),
                             style: ElevatedButton.styleFrom(
                             primary: Colors.white,
                             onPrimary: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                            onPressed: () {},
                             child: Text('do not agree'),
                             style: ElevatedButton.styleFrom(
                               primary: Colors.white,
                             onPrimary: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}