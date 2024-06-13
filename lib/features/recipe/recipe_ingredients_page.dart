import 'package:flutter/material.dart';

class RecipeIngredientsPage extends StatelessWidget {
  const RecipeIngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFEFE),
        surfaceTintColor: const Color(0xFFFEFEFE),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ингредиенты',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Text(
                'Пожалуйста, подготовьте ингредиенты перед началом приготовления',
                style: TextStyle(fontSize: 16)),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/steps');
                },
                child: const Text(
                  'Дальше',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: Colors.amber,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}
