import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../../Core/Const/color_pallet.dart';
import '../../../../Core/Routes/page_routes_name.dart';
import '../../../../Core/Utils/firebase_auth.dart';
import '../../../../Core/Widgets/custome_Button.dart';
import '../../../../Core/Widgets/custome_text_field.dart';
import '../../../../gen/assets.gen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Assets.image.logo.image(width: mediaQuery.size.width * 0.5),

                const SizedBox(height: 30),
                CustomTextFormField(
                  hintText: "Email",
                  prefixIcon: Assets.icons.email.image(
                    color: ColorPallet.iconColorLight,
                  ),
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email";
                    }
                    final RegExp regex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!regex.hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                CustomTextFormField(
                  hintText: "Password",
                  prefixIcon: Assets.icons.passwordIcon.image(
                    color: ColorPallet.iconColorLight,
                  ),
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomButton(
                  buttonText: "Login",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool result = await FirebaseAuthentication.signIn(
                        _emailController.text,
                        _passwordController.text,
                      );

                      if (result) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          PageRoutesName.layoutRout,
                          (route) => false,
                        );
                      } else {
                        _showNoAccountDialog();
                      }
                    }
                  },
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Bounceable(
                      onTap: () {
                        Navigator.of(
                          context,
                        ).pushNamed(PageRoutesName.registerRout);
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: ColorPallet.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPallet.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showNoAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Account not found"),
        content: const Text(
          "No account exists with this email. Would you like to create one?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(PageRoutesName.registerRout);
            },
            child: const Text("Create Account"),
          ),
        ],
      ),
    );
  }
}
