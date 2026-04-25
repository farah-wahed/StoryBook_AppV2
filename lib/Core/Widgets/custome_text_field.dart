import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../Const/color_pallet.dart';


class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final bool isPassword;
  final int? maxLines;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.maxLines = 1,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      cursorColor: ColorPallet.primaryColor,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? obscureText : false,
      style: theme.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: ColorPallet.textFormFiledBorderColor,
      ),
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: ColorPallet.textFormFiledBorderColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color:  ColorPallet.textFormFiledBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide( color:  ColorPallet.textFormFiledBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red),
        ),

        prefixIcon: widget.prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            width: 24,
            height: 24,
            child: widget.prefixIcon,

          ),
        )
            : null,


        suffixIcon: widget.isPassword
            ? Bounceable(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText ? Icons.visibility_off: Icons.visibility,
            color: ColorPallet.iconColorLight ,
          ),
        )
            : null,
      ),
    );
  }
}
