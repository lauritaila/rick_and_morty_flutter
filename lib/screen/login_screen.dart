// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
//component
import 'package:rick_and_morty/components/login_input.dart';
//dependencies
import 'package:rick_and_morty/provider/login_provider.dart';
import 'package:provider/provider.dart';
//models
import '../models/user.model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                      width: double.infinity,
                      height: 470,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/login_background.png'),
                              fit: BoxFit.cover)))),
              Positioned(
                  bottom: 0,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(18, 17, 26, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 50),
                            const Text(
                              'Hoola 🖖',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Correo',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 4),
                                LoginInput(
                                    controller: userController,
                                    placeholder: 'ejemplo@correo.com',
                                    visibility: false,
                                    validator: 1),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Contraseña',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 4),
                                LoginInput(
                                    controller: passwordController,
                                    placeholder: '*********',
                                    visibility: true,
                                    validator: 2),
                              ],
                            ),
                            const SizedBox(height: 4),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Ink(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(0, 245, 160, 1),
                                      Color.fromRGBO(0, 217, 245, 1)
                                    ]),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 51,
                                  width: double.infinity,
                                  child: const Text(
                                    'Ingresar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  UserModel usuario = UserModel(
                                      email: userController.text,
                                      password: passwordController.text);
                                  await provider.logIn(usuario);
                                  var singIna = provider.singIn;
                                  if (singIna == true) {
                                    Navigator.pushNamed(context, '/home');
                                  }else{
                                    //error
                                  }
                                }
                              },
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
