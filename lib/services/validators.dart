import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite um email';
  }
  if (!email.isEmail) return 'Digite um email válido';
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return "Digite uma senha";
  }
  if (password.length < 7) {
    return "Digite uma senha com pelo menos 7 caracteres";
  }
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite um CPF';
  }
  if (!cpf.isCpf) return 'Digite um CPF válido';
  return null;
}
