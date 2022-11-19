import 'package:compartilhando_gurda/controls/user_control.dart';
import 'package:compartilhando_gurda/screens/signup_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreens extends StatefulWidget {
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  //const HomeScreens({super.key});

  bool isObscure = false;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SizedBox(
              height: 600,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo.png',
                    width: 150,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: userController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  label: Text(
                                'Usuário',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return "Digite uma senha";
                                }
                                if (password.length < 7) {
                                  return "Digite uma senha com pelo menos 7 caracteres";
                                }
                                return null;
                              },
                              controller: passwordController,
                              obscureText: isObscure == false ? true : false,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isObscure = !isObscure;
                                        });
                                      },
                                      icon: isObscure == false
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility)),
                                  label: const Text(
                                    'Senha',
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                      colors: [Colors.green, Colors.blue])),
                              child: GetX<UserControls>(
                                builder: (controls) {
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          String email = userController.text;
                                          String password =
                                              passwordController.text;
                                          controls.signIn(
                                              email: email, password: password);
                                          print('Usuário loagado');
                                        } else {
                                          print('Campos inválidos');
                                        }
                                      },
                                      child: controls.isLoading.value
                                          ? const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            )
                                          : const Text(
                                              'LOGIN',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ));
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Não possui uma conta?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return const SignUpScreens();
                                      }));
                                    },
                                    child: const Text(
                                      "Cadastre-se",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
