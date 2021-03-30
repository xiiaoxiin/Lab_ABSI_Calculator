import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   
   TextEditingController sexTextEditingController = new TextEditingController();
   TextEditingController ageTextEditingController = new TextEditingController();
   TextEditingController heightTextEditingController = new TextEditingController();
   TextEditingController weightTextEditingController = new TextEditingController();
   TextEditingController waistTextEditingController = new TextEditingController();

  double height=0.0, weight=0.0, waist=0.0,bmi=0.0, result=0.0;
  String absi;
  String status = '';
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
            title: Text('ABSI Calculator'),
            backgroundColor: Colors.greenAccent),
        body: Container(
          padding:EdgeInsets.symmetric(
            vertical:50.0,horizontal:10.0,
          ),
          child: Form(
               child: Column(
            children: <Widget>[
              TextFormField(
                controller:sexTextEditingController,
                  decoration: InputDecoration(
                      labelText: 'Sex',
                      hintText: 'Female/Male',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              TextFormField(
                controller:ageTextEditingController,
                  decoration: InputDecoration(
                      labelText: 'Age',
                      hintText:'years',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              TextFormField(
                controller:heightTextEditingController,
                  decoration: InputDecoration(
                      labelText: 'Height',
                      hintText:'centimeters(cm)/meters(m)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              TextFormField(
                controller:weightTextEditingController,
                  decoration: InputDecoration(
                      labelText: 'Weight',
                      hintText:'kilograms(kg)/pounds(lb)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              TextFormField(
                controller:waistTextEditingController,
                  decoration: InputDecoration(
                      labelText: 'Waist Circumference',
                      hintText:'centimeters(cm)/meters(m)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              Container(height:20,width:double.infinity),
              new MaterialButton(shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
              elevation:5.0, minWidth:100.0, height:30,
              onPressed:_onPress,
              child:Text("Result"),
              color:Colors.grey[200],
              textColor: Colors.black,
              ),
              SizedBox(
                height:15,
              ),
              Text("ABSI=  $absi\n\n$status",textAlign:TextAlign.center,style: new TextStyle(fontSize:20.0,color: Colors.blue[400],fontWeight:FontWeight.w200,fontFamily:"Merriweather",)),
            ],
          )),
        ),
      ),
    );
  }

  void _onPress() {
    setState((){
      height = double.parse(waistTextEditingController.text);
      weight = double.parse(waistTextEditingController.text);
      waist = double.parse(waistTextEditingController.text);
      
      double cm = height*0.01;
      bmi = weight/(cm*cm);
      
      double waistCm = waist*0.01;
      result = waistCm/(pow((weight / pow(height, 2)), 2 / 3) * pow(height, 1 / 2));
      absi = format(result);
      print(result);

      if(result>2){
        status = 'According to your ABSI, your premature mortality risk is very high';
      } 
      else if(result>=1.9){
         status = 'According to your ABSI, your premature mortality risk is high';
      }
      else{
        status = 'According to your ABSI, your premature mortality risk is low.';
      }
      print(status);
    });
  }

  String format(double n){
    return n.toStringAsFixed(n.truncateToDouble()== n?0:2);
  }
}


