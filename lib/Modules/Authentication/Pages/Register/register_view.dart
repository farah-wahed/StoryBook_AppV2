import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../../../../Core/Const/color_pallet.dart';
import '../../../../Core/Routes/page_routes_name.dart';
import '../../../../Core/Utils/firebase_auth.dart';
import '../../../../Core/Widgets/custome_Button.dart';
import '../../../../Core/Widgets/custome_text_field.dart';
import '../../../../gen/assets.gen.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Assets.image.logo.image(
                      width: mediaQuery.size.width * 0.45,
                    ),
                  ),

                  const SizedBox(height: 20),

                  CustomTextFormField(
                    hintText: "Name",
                    prefixIcon: Assets.icons.personIcon.image(),
                    controller: _nameController,
                    validator: (value) =>
                        value == null || value.isEmpty ? "Enter name" : null,
                  ),

                  const SizedBox(height: 20),

                  CustomTextFormField(
                    hintText: "Email",
                    prefixIcon: Assets.icons.email.image(),
                    controller: _emailController,
                    validator: (value) =>
                        value == null || value.isEmpty ? "Enter email" : null,
                  ),

                  const SizedBox(height: 20),

                  CustomTextFormField(
                    hintText: "Password",
                    isPassword: true,
                    prefixIcon: Assets.icons.passwordIcon.image(),
                    controller: _passwordController,
                    validator: (value) => value == null || value.isEmpty
                        ? "Enter password"
                        : null,
                  ),

                  const SizedBox(height: 20),

                  CustomTextFormField(
                    hintText: "Confirm Password",
                    isPassword: true,
                    prefixIcon: Assets.icons.passwordIcon.image(),
                    controller: _rePasswordController,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  CustomButton(
                    buttonText: _isLoading ? "Loading..." : "Create Account",
                    onPressed: _isLoading
                        ? null
                        : () async {
                            if (!_formKey.currentState!.validate()) return;

                            setState(() => _isLoading = true);

                            bool result =
                                await FirebaseAuthentication.createAccount(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  _nameController.text.trim(),
                                );

                            setState(() => _isLoading = false);

                            if (result) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                PageRoutesName.loginRout,
                                (route) => false,
                              );
                            }
                          },
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      const SizedBox(width: 5),
                      Bounceable(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: ColorPallet.primaryColor,
                            decoration: TextDecoration.underline,
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
      ),
    );
  }
}
