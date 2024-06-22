import 'package:flutter/material.dart';

FloatingActionButton backBtn(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/');
    },
    backgroundColor: const Color(0xffE94D01),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
    elevation: 0,
    child: const Icon(Icons.arrow_back),
  );
}

Text accountMainTextStyle(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: Color(0xff1D3557),
    ),
  );
}

Text accountSubTextStyle(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xff1D3557),
    ),
  );
}

TextField textFieldForm(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    style: const TextStyle(
      color: Color(0xff1D3557),
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
      prefixIcon: Icon(icon, color: const Color(0xff1D3557)),
      labelText: text,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container customButton(BuildContext context, String isLogIn, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.black26;
            }
            return const Color(0xff1D3557);
          }),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: Text(isLogIn),
    ),
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
