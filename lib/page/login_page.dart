

import 'package:flutter/material.dart';
import 'package:neiproject2021/bloc/login_bloc.dart';
import 'package:neiproject2021/bloc/provider.dart';
import 'package:neiproject2021/model/auth_request_model.dart';
import 'package:neiproject2021/service/login_service.dart';
// import 'package:local_auth/local_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String emailsillo = '';
  String passwordsillo = '';
  bool checkSelectionBox = false;
  final service = LoginService();


  @override
  void initState() { 
    super.initState();
    // emailsillo= preferences.lastEmail;
    // passwordsillo = preferences.lastPassword;
    // checkSelectionBox = preferences.lastCheckBox;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        body: Stack(
          children: [fondoRojo(), login(context)],
        ));
  }

  Widget fondoRojo() {
    final size = MediaQuery.of(context).size;

    final cabecera = Container(
      height: size.height * 0.4,
      width: size.width,
      color: Colors.red,
    );

    final titulo = Container(
      margin: EdgeInsets.only(
        top: 100,
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 80,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Login Eni Project',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ),
    );

    return Stack(
      children: [cabecera, titulo],
    );
  }

  Widget login(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 200.0,
          )),
          Container(
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text('Log in'),
                  email(bloc),
                  SizedBox(
                    height: 20.0,
                  ),
                  password(bloc),
                  SizedBox(
                    height: 20.0,
                  ),
                  // checkBox(),
                  button(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget email(LoginBloc bloc) {
    return 
    StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          return
           TextFormField(
            // initialValue: preferences.lastEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Colors.red,
              ),
              labelText: 'Email',
              hintText: 'Email',
              errorText: snapshot.error,
            ),
            onChanged: (value) {
              bloc.changeEmail;
              setState(() {
                emailsillo = value;
              });
            },
          );

        });
  }

  Widget password(LoginBloc bloc) {
    return 
    StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return 
          TextFormField(
            // initialValue: preferences.lastPassword,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.red),
                labelText: 'Contraseña',
                hintText: 'Contraseña',
                // counterText: snapshot.data,
                // errorText: snapshot.error),
           
            
            ),
             onChanged: (value) {
              bloc.changePassword;
              setState(() {
                passwordsillo = value;
              });
            },
          );
        });
  }

  

  Widget checkBox() {
    return CheckboxListTile(
        title: Text('Recordar credenciales'),
        // value: preferences.lastCheckBox,
        value: true,
        onChanged: (value) {
          saveCredentials(value);
        });
  }

  void saveCredentials(value) {
    setState(() {
      checkSelectionBox = value;

      // if (checkSelectionBox) {
      //   preferences.lastCheckBox = value;
      //   preferences.lastEmail = emailsillo;
      //   preferences.lastPassword = passwordsillo;
      // } else {
      //   preferences.lastCheckBox = checkSelectionBox;
      //   preferences.lastEmail = '';
      //   preferences.lastPassword = '';
      // }
    });
  }

  Widget button(BuildContext context) {
    return RaisedButton(
        child: Text(
          'Ingresar',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.red,
        onPressed: () {
          request(context);
        });
  }

  void request(BuildContext context) async {
    AuthRequest authRequest = AuthRequest();
    authRequest.email =emailsillo;
    authRequest.password = passwordsillo;
    var info = await service.sendRequest(authRequest);
    print(info);

    if (info.id != null) {
      Navigator.pushNamed(context, 'home');
    } else {
      alerta(context);
    }
  }

  void alerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('El usuario y/0 contraseña ivalida'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
