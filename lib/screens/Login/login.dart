import 'package:flutter/material.dart';

import 'package:storeaksdk/models/Inventory/ProductsPageModel.dart';
import 'file:///C:/AndroidStudio/fluttre_project/tast_b/lib/screens/HomePage/home_page.dart';
import 'package:tast_b/services/services_login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tast_b/services/services_product.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final GlobalKey<ScaffoldState> _loginFormKey = new GlobalKey<ScaffoldState>();
//////////////////////////////////////////////
  bool validatePass = false; ///////////////
  bool validatePassLength = false; //////////
  bool validateUserNameLength = false; ///////// this parameter bool to validate UserName and Password
  bool validateUserName = false; ////////////
  ///////////////////////////////////////
  bool _isHidden = true; ////////////////   this parameter boo to chick into icon button if checked or no

  String accessToken ; ////////     this parameter String to store AccessToken
  String tokenType; ///////////      this parameter String to store TokenType
  String tokenTypeCorrect; /////////       this parameter String to store TokenType after convert first char into toUpperCase and To combine it with the rest of String

  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();


  bool _isInAsyncCall = false;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  showAlertDialog(BuildContext context, String title) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Opps"),
      content: Text(title),
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

  @override
  Widget build(BuildContext context) {
    //  return loading ? Center(child: CircularProgressIndicator()) : Scaffold(
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Login",),),
      body:ModalProgressHUD(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: buildLoginForm(context),
          ),
        ),
        inAsyncCall: _isInAsyncCall,
        // demo of some additional parameters
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(),
      ),
    );
  }
  Widget buildLoginForm(BuildContext context){
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child:SingleChildScrollView(
          child:    Padding(
            padding: const EdgeInsets.all(18.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: username,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter userName';
                    }
                    if (value.length < 3) {
                      return 'userName less than 3 chars ';

                    }
                    return null;
                  },
                  decoration: InputDecoration(

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blueGrey, width: 2.0),
                    ),
                    labelText: "UserName",
                    labelStyle: TextStyle(
                        color: Colors.blueGrey
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),

                ),
                SizedBox(height: 5,),
                TextFormField(


                  textAlign: TextAlign.center,
                  controller: password,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 3) {
                      return 'password less than 3 chars';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blueGrey, width: 2.0),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.blueGrey
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _toggleVisibility,
                      icon: _isHidden ? Icon(
                        Icons.visibility_off, color: Colors.blueGrey,) : Icon(
                        Icons.visibility, color: Colors.blueGrey,),
                    ),
                  ),
                  obscureText: _isHidden,
                ),
                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.fromLTRB(20,7,20,7),
                  child: Material(
                    color: Colors.blueGrey,
                    elevation: 6,
                    borderRadius: BorderRadius.circular(30),
                    child: MaterialButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid
                          setState(() {
                            _isInAsyncCall = true;
                            FocusScope.of(context).requestFocus(new FocusNode());
                          });
                          log(username.text,password.text).then((value) {
                            if(value['bool']){

                              //this function to get data product from api
                              product().then((value) {
                                ProductsPageModel pageModel = value['result'];
                                ProductsPageModel pageModel2 = value['sortedResult'];
                                //navigator to Home page
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => HomePage(dataF:pageModel.results,data: pageModel2.results  , name: username.text,)));
                              }).whenComplete(() { setState(() {
                                _isInAsyncCall = false;
                              });});

                            }
                            else{
                              showAlertDialog(context,value['result']);
                            }
                          }).whenComplete(()  {
                            setState(() {
                             // _isInAsyncCall = false;
                            });
                          });

                        }
                      },
                      minWidth: (MediaQuery.of(context).size.width),
                      height: 45,
                      child: Text("LogIn" , style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
