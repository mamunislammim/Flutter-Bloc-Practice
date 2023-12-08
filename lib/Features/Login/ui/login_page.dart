import 'package:bloc_state_management_practice/Features/Home/ui/home.dart';
import 'package:bloc_state_management_practice/Features/Login/bloc/login_bloc.dart';
import 'package:bloc_state_management_practice/Repository/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _cidController = TextEditingController();
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginBloc loginBloc = LoginBloc();

  @override
  void dispose() {
    _cidController.dispose();
    _passwordController.dispose();
    _userIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: size.height / 4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/login.png"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 50,
                ),
                LoginFieldWidget(
                  text: 'CID',
                  controller: _cidController,
                  prefixIcon: const Icon(
                    Icons.file_copy_outlined,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                LoginFieldWidget(
                  text: 'User ID',
                  controller: _userIDController,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                LoginFieldWidget(
                  text: 'Password',
                  controller: _passwordController,
                  password: true,
                  obsSecureText: false,
                  prefixIcon: const Icon(
                    Icons.security,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<LoginBloc, LoginState>(
                  bloc: loginBloc,
                  listener: (BuildContext context, LoginState state) {
                    if (state is LoginLoadedState) {
                      if (state.status == "0") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Login Successful")));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (C) => const Home()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Login Failed..!!")));
                        //  loginBloc.add(LoginInitial)
                      }
                    }
                  },
                  builder: (BuildContext context, LoginState state) {
                    if (state is LoginInitial) {
                      return GestureDetector(
                        onTap: () async {
                          FocusManager.instance.primaryFocus!.unfocus();
                          if (await ConnectionChecker().checkConnection() ==
                                  false &&
                              mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("No Internet Connection..!!")));
                            return;
                          }
                          if (_formKey.currentState!.validate() == false) {
                            return;
                          }
                          loginBloc.add(LoginPressedEvent(
                              "IBNSINA",
                              _userIDController.text,
                              _passwordController.text));
                        },
                        child: Card(
                          color: Colors.green,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          child: SizedBox(
                            height: 45,
                            width: size.width,
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (state is LoginLoadingState) {
                      return const CircularProgressIndicator(
                        backgroundColor: Colors.green,
                        color: Colors.white,
                      );
                    } else {
                      return const Text("Error..........");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
