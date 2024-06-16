import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final Function(bool?)? onChanged;

  const CustomCheckbox({super.key, this.initialValue = false, this.onChanged});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      onChanged: (bool? newValue) {
        setState(() {
          _isChecked = newValue!;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      activeColor: const Color(0xFF002366),
      checkColor: Colors.white,
    );
  }
}
