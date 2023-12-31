import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config.dart';
import '../constants.dart';
import '../controllers/auth_controller.dart';
import '../services/firebase_service.dart';
import '../utils.dart';
import '../widget/my_button.dart';
import '../widget/my_text_filed.dart';
import 'vol_screen.dart';
import 'sign_up_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Constructeur de la classe LoginScreen
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Logo de l'application
                SizedBox(height: AppBar().preferredSize.height * 2),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Image.asset(
                    AppConstants.appLogo,
                    width: 80,
                    height: 100,
                  ),
                ),
                SizedBox(height: fullHeight(context) * 0.03),
                // Titre de la page de connexion
                const Text(
                  'Connexion',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                // Ligne de séparation sous le titre
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  endIndent: 270,
                ),
                SizedBox(height: fullHeight(context) * 0.04),
                // Champ de texte pour l'email
                MyTextFiled(
                  label: 'Email',
                  hint: 'sara@test.com',
                  controller: _authController.emailController,
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                // Champ de texte pour le mot de passe
                MyTextFiled(
                  label: 'Mot de passe',
                  hint: '**********',
                  controller: _authController.passwordController,
                ),
                SizedBox(height: fullHeight(context) * 0.04),
                Obx(() => _authController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    // Bouton de connexion
                    : MyButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _authController.setIsLoading(true);
                            // Appel de la fonction de connexion depuis FirebaseService
                            var loginResult = await _firebaseService.login(
                                _authController.emailController.text,
                                _authController.passwordController.text);
                            if (loginResult == true) {
                              _authController.setIsLoading(false);
                              // Redirection vers l'écran principal (MainScreen)
                              Get.to(const MainScreen());
                            } else {
                              _authController.setIsLoading(false);
                              // Affichage d'un message d'erreur en cas d'échec de connexion
                              showSnackbarError('Login failed !');
                            }
                          }
                        },
                        title: 'Se connecter')),
                SizedBox(height: fullHeight(context) * 0.03),
                // Lien vers l'écran d'inscription
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Vous n'avez pas de compte ? ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Inscrivez-vous ici',
                            style: TextStyle(
                              color: AppConstants.primaryColor,
                              fontWeight: FontWeight.w500
                            )
                          ),
                        ],
                      ),
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
