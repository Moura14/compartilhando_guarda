import 'package:compartilhando_gurda/services/validators.dart';
import 'package:flutter/material.dart';

class SignUpScreens extends StatelessWidget {
  SignUpScreens({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                  child: Form(
                      key: _formKey,
                      child: SizedBox(
                        height: 800,
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              'images/logo.png',
                              height: 200,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text(
                                'Nome completo',
                                style: TextStyle(color: Colors.grey),
                              )),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text(
                                'CPF',
                                style: TextStyle(color: Colors.grey),
                              )),
                              keyboardType: TextInputType.number,
                              validator: cpfValidator,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text(
                                'Email',
                                style: TextStyle(color: Colors.grey),
                              )),
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text(
                                  'Responsavel materno',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text(
                                'Responsavel paterno',
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
                                    colors: [Colors.green, Colors.blue]),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('logou');
                                  } else {
                                    print('error');
                                  }
                                },
                                child: const Text(
                                  'Cadastrar',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Já possui uma conta?',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Entre',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            )),
      ),
    );
  }
}
