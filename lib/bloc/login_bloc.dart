import 'dart:async';


class LoginBloc {


  final _passwordController = StreamController<String>.broadcast();
  final _emailController = StreamController<String>.broadcast();

  Stream<String> get passwordStream => _passwordController.stream;

  Stream<String> get emailStream => _emailController.stream;


  Function (String) get changePassword => _passwordController.sink.add;

  Function (String ) get changeEmail => _emailController.sink.add;


  dispose(){
    _passwordController.close();

    _emailController.close();

  }

}