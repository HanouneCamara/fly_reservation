import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../config.dart';
import '../controllers/auth_controller.dart';
import '../services/firebase_service.dart';
import '../utils.dart';
import '../widget/my_button.dart';
import '../widget/my_text_filed.dart';
import 'login_screen.dart';
import 'vol_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController _authController = Get.put(AuthController());
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                // Titre de la page d'inscription
                const Text(
                  'Inscription',
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
                SizedBox(height: fullHeight(context) * 0.02),
                // Champ de texte pour le nom
                MyTextFiled(
                  label: 'Nom',
                  hint: 'Sara Sidi',
                  controller: _authController.userNameController
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                // Champ de texte pour l'email
                MyTextFiled(
                  label: 'Email',
                  hint: 'sara@test.com',
                  controller: _authController.emailController
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                // Champ de texte pour le mot de passe
                MyTextFiled(
                  label: 'Mot de passe',
                    hint: '********',
                    controller: _authController.passwordController),
                
                SizedBox(height: fullHeight(context) * 0.04),
                Obx(
                  () => _authController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      // Bouton d'inscription
                      : MyButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _authController.setIsLoading(true);
                              // Appel de la fonction d'inscription depuis FirebaseService
                              var loginResult = await _firebaseService.signUp(
                                  _authController.emailController.text,
                                  _authController.passwordController.text);
                              _authController.setIsLoading(false);
                              if (loginResult == true) {
                                // Redirection vers l'écran principal (MainScreen)
                                Get.off(const MainScreen());
                              } else {
                                // Affichage d'un message d'erreur en cas d'échec d'inscription
                                showSnackbarError('Login failed !');
                              }
                            }
                          },
                          title: "S'inscrire"),
                ),
                SizedBox(height: fullHeight(context) * 0.03),
                // Lien vers l'écran de connexion
                Center(
                  child: GestureDetector(
                    onTap: () => Get.to(LoginScreen()),
                    child: RichText(
                      text: const TextSpan(
                        text: "Vous avez déjà un compte ? ",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Connectez ici',
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
