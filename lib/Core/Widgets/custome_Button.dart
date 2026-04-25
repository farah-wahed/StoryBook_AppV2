
import 'package:flutter/material.dart';
import '../Const/color_pallet.dart';


class CustomButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final Color? textColor;


  const CustomButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.textColor,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed?.call();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallet.primaryColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: ColorPallet.primaryColor),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child:
            Text(
              widget.buttonText ?? "",
              style: theme.textTheme.titleLarge?.copyWith(
                color: widget.textColor ?? Colors.white,
              ),
            ),
      ),
    );
  }
}
