import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key?key}):super( key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var res='';
  var bgcolor=Colors.indigoAccent.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Your BMI")),
      ),
      body:Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight(in kg)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height(in feet)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height(in inch)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  var wt=wtController.text;
                  var ft=ftController.text;
                  var inch=inController.text;
                  if(wt!=""&&ft!=''&&inch!=''){
                    var iwt=int.parse(wt);
                    var ift=int.parse(ft);
                    var inft=int.parse(inch);

                    var tinch=(ift*12)+inft;
                    var tcm=tinch*2.54;
                    var tm=tcm/100;

                    var bmi=iwt/(tm*tm);

                    var msg="";
                    if(bmi>25){
                      msg="You are overweight";
                      bgcolor=Colors.redAccent;
                    }
                    else if(bmi<18){
                      msg="You are underweight";
                      bgcolor=Colors.redAccent;
                    }
                    else{
                      msg="You are fit";
                      bgcolor=Colors.lightGreenAccent;
                    }
                    setState(() {
                      res="$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });

                  }
                  else{
                    setState(() {
                      res="Please fill all the required blanks";
                    });
                  }
                },
                    child: Text('Calculate')),
                SizedBox(height: 10,),
                Text(res,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
