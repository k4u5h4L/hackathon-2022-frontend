import 'package:dr_jadoo/constants/colours.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.controller,
      this.enabled,
      this.obscureText = false,
      this.autocorrect = true,
      this.maxLength,
      this.hintText,
      this.labelText,
      this.focusNode,
      this.textInputAction,
      this.keyboardType,
      this.onSubmitted,
      this.onTap,
      this.onChanged,
      this.validator,
      this.maxLines = 1,
      this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  final TextEditingController? controller;
  final bool? enabled;
  final bool obscureText;
  final bool autocorrect;
  final int? maxLength;
  final String? hintText;
  final String? labelText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(screenWidth * 0.05)
      ),
      child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          enabled: enabled,
          focusNode: focusNode,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          autocorrect: autocorrect,
          obscureText: obscureText,
          maxLength: maxLength,
          decoration: InputDecoration(
            icon: prefixIcon,
            suffixIcon: suffixIcon,
            hintStyle: Theme.of(context)
                .textTheme
                .subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey
                ),
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            border: InputBorder.none,
            labelStyle: Theme.of(context)
                .textTheme
                .subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
            labelText: labelText,
            isDense: true,
            fillColor: Theme.of(context).secondaryHeaderColor,
          )),
    );
  }
}