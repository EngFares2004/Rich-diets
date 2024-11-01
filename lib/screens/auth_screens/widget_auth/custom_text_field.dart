import 'package:flutter/material.dart';
import 'package:task3/configuration/app_theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.validator,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.suffix,
    this.keyboardType,
    this.isPassword = false,
    this.controller,
  });

  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorText;

  void _handleTextChanged(String value) {
    setState(() {
      _errorText = widget.validator != null ? widget.validator!(value) : null;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  InputBorder generateBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(10),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: TextFormField(
        style: const TextStyle(color: AppTheme.primaryColor),
        maxLines: 1,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword,
        onChanged: _handleTextChanged,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Color(0xffBFBFBF)),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          suffix: widget.suffix,
          alignLabelWithHint: false,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          enabledBorder: generateBorder(borderColor: Colors.grey),
          focusedBorder: generateBorder(borderColor: AppTheme.primaryColor),
          errorBorder: generateBorder(borderColor: Colors.red),
          focusedErrorBorder: generateBorder(borderColor: Colors.red),
          errorText: _errorText,
          errorStyle: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
