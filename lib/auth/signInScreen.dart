import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/auth/forgotPasswordScreen.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/routes.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'signUpScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _visible = false;
  bool _isInProgress = false;
  bool _isClickonSignUp = false;
  bool _isClickonForgotPassword = false;

  animation() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _visible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    animation();
  }

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();
    double appBarheight = appBar.preferredSize.height;
    return Stack(
      children: <Widget>[
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor(globals.primaryColorString).withOpacity(0.6),
                HexColor(globals.primaryColorString).withOpacity(0.6),
                HexColor(globals.primaryColorString).withOpacity(0.6),
                HexColor(globals.primaryColorString).withOpacity(0.6),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: AllCoustomTheme.getThemeData().primaryColor,
          body: ModalProgressHUD(
            inAsyncCall: _isInProgress,
            opacity: 0,
            progressIndicator: SizedBox(),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: appBarheight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Animator(
                          tween: Tween<Offset>(
                              begin: Offset(0, 0), end: Offset(0.2, 0)),
                          duration: Duration(seconds: 1),
                          cycles: 0,
                          builder: (anim) => FractionalTranslation(
                            translation: anim.value,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AllCoustomTheme.getTextThemeColors(),
                            ),
                          ),
                        ),
                      ),
                      !_isClickonSignUp
                          ? GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _isClickonSignUp = true;
                                });
                                await Future.delayed(
                                    const Duration(milliseconds: 700));

                                Navigator.of(context, rootNavigator: true)
                                    .push(
                                  CupertinoPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        SignUpScreen(),
                                  ),
                                )
                                    .then((onValue) {
                                  setState(() {
                                    _isClickonSignUp = false;
                                  });
                                });
                              },
                              child: Animator(
                                tween: Tween<double>(begin: 0.8, end: 1.1),
                                curve: Curves.easeInToLinear,
                                cycles: 0,
                                builder: (anim) => Transform.scale(
                                  scale: anim.value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                        color: AllCoustomTheme
                                            .getTextThemeColors(),
                                        fontSize: ConstanceData.SIZE_TITLE18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: CupertinoActivityIndicator(
                                radius: 12,
                              ),
                            )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: <Widget>[
                      Animator(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: Duration(seconds: 1),
                        cycles: 1,
                        builder: (anim) => SizeTransition(
                          sizeFactor: anim,
                          axis: Axis.horizontal,
                          axisAlignment: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: AllCoustomTheme.getTextThemeColors(),
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: _visible
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30)),
                              color: AllCoustomTheme.boxColor(),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 0.5,
                                  ),
                                  Container(
                                    height: 5,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(2)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          globals.buttoncolor1,
                                          globals.buttoncolor2,
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: 14, top: 4),
                                          child: TextFormField(
                                            validator: _validateEmail,
                                            cursorColor: AllCoustomTheme
                                                .getTextThemeColors(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ConstanceData.SIZE_TITLE16,
                                              color: AllCoustomTheme
                                                  .getTextThemeColors(),
                                            ),
                                            keyboardType: TextInputType.text,
                                            decoration: new InputDecoration(
                                              focusColor: AllCoustomTheme
                                                  .getTextThemeColors(),
                                              fillColor: AllCoustomTheme
                                                  .getTextThemeColors(),
                                              hintText: 'Enter email here...',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: ConstanceData
                                                      .SIZE_TITLE14),
                                              labelText: 'E-mail',
                                              labelStyle: TextStyle(
                                                fontSize:
                                                    ConstanceData.SIZE_TITLE16,
                                                color: AllCoustomTheme
                                                    .getTextThemeColors(),
                                              ),
                                            ),
                                            //controller: lastnameController,
                                            onSaved: (value) {
                                              setState(() {
                                                //lastnamesearchText = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 14, bottom: 10),
                                          child: TextFormField(
                                            cursorColor: AllCoustomTheme
                                                .getTextThemeColors(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ConstanceData.SIZE_TITLE16,
                                              color: AllCoustomTheme
                                                  .getTextThemeColors(),
                                            ),
                                            keyboardType: TextInputType.text,
                                            obscureText: true,
                                            decoration: new InputDecoration(
                                              focusColor: AllCoustomTheme
                                                  .getTextThemeColors(),
                                              fillColor: AllCoustomTheme
                                                  .getTextThemeColors(),
                                              hintText:
                                                  'Enter password here...',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: ConstanceData
                                                      .SIZE_TITLE14),
                                              labelText: 'Password',
                                              labelStyle: TextStyle(
                                                fontSize:
                                                    ConstanceData.SIZE_TITLE16,
                                                color: AllCoustomTheme
                                                    .getTextThemeColors(),
                                              ),
                                            ),
                                            validator: _validatePassword,
                                            //controller: lastnameController,
                                            onSaved: (value) {
                                              setState(() {
                                                //lastnamesearchText = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, left: 14, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        !_isClickonForgotPassword
                                            ? GestureDetector(
                                                onTap: () async {
                                                  setState(() {
                                                    _isClickonForgotPassword =
                                                        true;
                                                  });
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 700));

                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(
                                                    CupertinoPageRoute<void>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ForgotPasswordScreen(),
                                                    ),
                                                  )
                                                      .then((onValue) {
                                                    setState(() {
                                                      _isClickonForgotPassword =
                                                          false;
                                                    });
                                                  });
                                                },
                                                child: Text(
                                                  'Forgot Password?',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AllCoustomTheme
                                                        .getTextThemeColors(),
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child:
                                                    CupertinoActivityIndicator(
                                                  radius: 12,
                                                ),
                                              ),
                                        SizedBox(
                                          height: 50,
                                          child: !_isInProgress
                                              ? GestureDetector(
                                                  onTap: () {
                                                    _submit();
                                                  },
                                                  child: Animator(
                                                    tween: Tween<double>(
                                                        begin: 0.8, end: 1.1),
                                                    curve:
                                                        Curves.easeInToLinear,
                                                    cycles: 0,
                                                    builder: (anim) =>
                                                        Transform.scale(
                                                      scale: anim.value,
                                                      child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          border:
                                                              new Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 1.5),
                                                          shape:
                                                              BoxShape.circle,
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              globals
                                                                  .buttoncolor1,
                                                              globals
                                                                  .buttoncolor2,
                                                            ],
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 3),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            size: 20,
                                                            color: AllCoustomTheme
                                                                .getTextThemeColors(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 14),
                                                  child:
                                                      CupertinoActivityIndicator(
                                                    radius: 12,
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                  _visible
                      ? Expanded(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Padding(
                               padding: const EdgeInsets.only(bottom: 16),
                                child: Text(
                                  'Terms & Privacy Policy',
                                  style: TextStyle(
                                    color: AllCoustomTheme
                                        .getsecoundTextThemeColor(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  var myScreenFocusNode = FocusNode();

  _submit() async {
    setState(() {
      _isInProgress = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));

    FocusScope.of(context).requestFocus(myScreenFocusNode);
    if (_formKey.currentState.validate() == false) {
      setState(() {
        _isInProgress = false;
      });
      return;
    }
    //_formKey.currentState.save();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.Home, (Route<dynamic> route) => false);
  }

  String _validateEmail(value) {
    // if (value.isEmpty) {
    //   return "Email cannot be empty";
    // } else if (Validators.validateEmail(value) == false) {
    //   return "Please enter valid email";
    // }
    return null;
  }

  String _validatePassword(value) {
    // if (value.isEmpty) {
    //   return "Password cannot be empty";
    // }
    // else if (value.length < 5) {
    //   return 'Password must contains ${5} characters';
    // }
    // else {
    return null;
    //   }
  }
}

class Validators {
  static const Pattern _pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp _regex = new RegExp(_pattern);

  static bool validateEmail(String value) {
    return _regex.hasMatch(value);
  }
}
