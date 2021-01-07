import 'package:flutter/material.dart';
import 'package:tesnusantech/CustomTextField.dart';
import 'package:tesnusantech/ResponsiveWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height;
  double _width;
  double _pixelRatio;
  String hasilfix="";
  bool _large;
  bool _medium;
  var firstColor = Color(0xff5b86e5),
      secondColor = Color(0xff36d1dc);
  TextEditingController value1controller = new TextEditingController();
  TextEditingController value2controller = new TextEditingController();
  TextEditingController value3controller = new TextEditingController();

  bool cekvalue1 = false;
  bool cekvalue2 = false;
  bool cekvalue3 = false;
  double value1, value2, value3;
  EdgeInsets contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0);

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text("Tes Nusantech"),),
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                form(context, _width, _height),
                SizedBox(height: _height/35,),
                Builder(builder: (context2)=>button(context2),
                ),
                SizedBox(height: _height/35,),
                
                Text("Hasil dari inputan = "+hasilfix)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget form(BuildContext context2, double width, height) {
    return Container(
      margin: EdgeInsets.only(
          left:_width/ 18.0,
          right: _width / 18.0,
          top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              width: _width,
              child: Row(
                children: [
                  Container(
                    width: width*0.78,
                    child: Value1(),
                  ),

                  Checkbox(value: cekvalue1, onChanged: (newValue) {
                    setState(() {
                      cekvalue1 = newValue;
                    });
                  },
                  )
                ],
              ),
            ),

            SizedBox(height: _height / 60.0),
            Container(
              width: _width,
              child: Row(
                children: [
                  Container(
                    width: width*0.78,
                    child: Value2(),
                  ),

                  Checkbox(value: cekvalue2, onChanged: (newValue) {
                    setState(() {
                      cekvalue2 = newValue;
                    });
                  },
                  )
                ],
              ),
            ),
            SizedBox(height: _height/ 60.0),
            Container(
              width: _width,
              child: Row(
                children: [
                  Container(
                    width: width*0.78,
                    child: Value3(),
                  ),

                  Checkbox(value: cekvalue3, onChanged: (newValue) {
                    setState(() {
                      cekvalue3 = newValue;
                    });
                  },
                  )
                ],
              ),
            ),
            SizedBox(height: _height / 60.0),

          ],
        ),
      ),
    );
  }

  Widget Value1() {
    return CustomTextField(
      textEditingController: value1controller,
      enabled: false,
      keyboardType: TextInputType.number,
      icon: Icons.calculate,
      hint: "Nilai pertama",
    );
  }

  Widget Value2() {
    return CustomTextField(
      textEditingController: value2controller,
      enabled: false,
      keyboardType: TextInputType.number,
      icon: Icons.calculate,
      hint: "Nilai kedua",
    );
  }

  Widget Value3() {
    return CustomTextField(
      textEditingController: value3controller,
      enabled: false,
      keyboardType: TextInputType.number,
      icon: Icons.calculate,
      hint: "Nilai ketiga",
    );
  }

  Widget button(BuildContext context2) {
    return Container(
      padding: EdgeInsets.only(right: 8, left: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text('+'),
              onPressed: () {
                bool cek= Checklist(cekvalue1, cekvalue2, cekvalue3, context2);
                if(cek==true){
                  checkvalue(value1controller.text,
                      value2controller.text,
                      value3controller.text, context2, "+");
                }else{

                }

              }
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text('-'),
                onPressed: () {
                  bool cek= Checklist(cekvalue1, cekvalue2, cekvalue3, context2);
                  if(cek==true){
                    checkvalue(value1controller.text,
                        value2controller.text,
                        value3controller.text, context2, "-");
                  }else{

                  }

                }
              ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text('x'),
                onPressed: () {
                  bool cek= Checklist(cekvalue1, cekvalue2, cekvalue3, context2);
                  if(cek==true){
                    checkvalue(value1controller.text,
                        value2controller.text,
                        value3controller.text, context2, "x");
                  }else{

                  }
                }
              ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text('/'),
                onPressed: () {
                  bool cek= Checklist(cekvalue1, cekvalue2, cekvalue3, context2);
                  if(cek==true){
                    checkvalue(value1controller.text,
                        value2controller.text,
                        value3controller.text, context2, "/");
                  }else{

                  }
                }
              ),
          )

        ],
      )
    );
  }

  void hasil(double text1, text2, String metode, BuildContext context2){
    double result;
    switch(metode){
      case "+":
        result = text1+text2;
        setState(() {
          hasilfix = result.toString();
        });
        break;
      case "-":
        result = text1-text2;
        setState(() {
          hasilfix = result.toString();
        });
        break;
      case "x":
        result = text1*text2;
        setState(() {
          hasilfix = result.toString();
        });
        break;
      case "/":
        result = text1/text2;
        setState(() {
          hasilfix = result.toString();
        });
        break;
      default:
        Scaffold.of(context2).showSnackBar(SnackBar(
          content: Text("Mohon maaf, Operator tidak terdefinisi"),
        ));
        break;
    }
    print("Hasil Fix = "+hasilfix);

  }

  void hasilall(double text1, text2, text3, String metode, BuildContext context2){
    double result;

    switch(metode){
      case "+":
        result = text1+text2+text3;
        setState(() {
          hasilfix = result.toString();
        });
        break;
      case "-":
        result = text1-text2-text3;
        setState(() {
          hasilfix = result.toString();
        });
        break;
      case "x":
        result = text1*text2*text3;
        setState(() {
          hasilfix = result.toString();
        });
        break;
      case "/":
        result = text1/text2/text3;
        setState(() {
          hasilfix = result.toString();
        });
        break;
      default:
        Scaffold.of(context2).showSnackBar(SnackBar(
          content: Text("Mohon maaf, Operator tidak terdefinisi"),
        ));
        break;
    }

    print("Hasil Fix = "+hasilfix);
  }

  bool checkvalue(String text1, String text2, String text3, BuildContext context2, String metode){
    bool a =  text1.isNotEmpty&&cekvalue1==true;
    bool b =  text2.isNotEmpty&&cekvalue2==true ;
    bool c =  text3.isNotEmpty&&cekvalue3==true;

    bool cek1 = a==true && b==true && c==true;
    bool cek2 = a==true && b==true && c==false;
    bool cek3 = a==true && c==true && b==false;
    bool cek4 = b==true && c==true && a==false;

    print("Value 1 ="+a.toString());
    print("Value 2 ="+b.toString());
    print("Value 3 ="+c.toString());
    print("Cek 1 ="+cek1.toString());
    print("Cek 2 ="+cek2.toString());
    print("Cek 3 ="+cek3.toString());
    print("Cek 4 ="+cek4.toString());

    if(cek1==true){
      hasilall(double.parse(text1), double.parse(text2), double.parse(text3), metode, context2);
    }else if(cek2==true){
      hasil(double.parse(text1), double.parse(text2), metode, context2);
    } else if(cek3==true){
      hasil(double.parse(text1), double.parse(text3), metode, context2);
    } else if(cek4==true){
      hasil(double.parse(text2), double.parse(text3), metode, context2);
    }else{
      Scaffold.of(context2).showSnackBar(SnackBar(
        content: Text("Mohon maaf, Silahkan isi nilai anda, minimal 2 nilai dan sudah terchecklist"),
      ));
    }


  }

  bool Checklist(bool a, bool b, bool c, BuildContext context2){
    switch(a && (b || c) || (b && c)==true){
      case true:
        return true;
        break;
      case false:
        Scaffold.of(context2).showSnackBar(SnackBar(
          content: Text("Mohon maaf, Silahkan pilih dahulu checklist pada nilai anda, minimal 2 checklist"),
        ));
        return false;
        break;
      default:
        Scaffold.of(context2).showSnackBar(SnackBar(
          content: Text("Mohon maaf, Silahkan pilih dahulu checklist pada nilai anda, minimal 2 checklist"),
        ));
        return false;
        break;
    }

  }

}
