import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sau_tamaq_flutter/common/recipe_image_block.dart';
import 'package:sau_tamaq_flutter/features/recipe/recipe_ingredients_page.dart';

class RecipeInfo extends StatefulWidget {
  final String recipeCardTitle;
  final String recipeCardTime;
  final String recipeCardImg;
  final String recipeLevel;
  final String recipeCalories;
  final Map<String, String> recipeIngredients;
  final Map<String, String> recipeCookSteps;

  const RecipeInfo({
    super.key,
    required this.recipeCardTitle,
    required this.recipeCardTime,
    required this.recipeCardImg,
    required this.recipeLevel,
    required this.recipeCalories,
    required this.recipeIngredients,
    required this.recipeCookSteps,
  });

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  int servings = 1;

  Map<String, String> _scaleIngredients(
      Map<String, String> ingredients, int scale) {
    return ingredients.map((key, value) {
      final quantity = _parseQuantity(value);
      final scaledQuantity = quantity * scale;
      return MapEntry(key, _formatQuantity(scaledQuantity, value));
    });
  }

  double _parseQuantity(String quantity) {
    final match = RegExp(r'(\d+(\.\d+)?)').firstMatch(quantity);
    return match != null ? double.parse(match[0]!) : 1.0;
  }

  String _formatQuantity(double quantity, String original) {
    return original.replaceFirst(RegExp(r'(\d+(\.\d+)?)'), quantity.toString());
  }

  @override
  Widget build(BuildContext context) {
    final scaledIngredients =
        _scaleIngredients(widget.recipeIngredients, servings);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Рецепт'),
        backgroundColor: const Color(0xFFFEFEFE),
        surfaceTintColor: const Color(0xFFFEFEFE),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: RecipeImageBlock(
                    recipeImage: widget.recipeCardImg,
                    recipeName: widget.recipeCardTitle,
                  ),
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD2E7FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecipeInfoWidget(
                          widgetIcon: FontAwesomeIcons.fireFlameCurved,
                          mainText: widget.recipeCalories,
                          subText: 'Калории',
                          iconColor: const Color(0xffFD3250),
                        ),
                        RecipeInfoWidget(
                          widgetIcon: Icons.access_time_filled_sharp,
                          mainText: '${widget.recipeCardTime} мин',
                          subText: 'Время',
                          iconColor: const Color(0xffFFAC33),
                        ),
                        RecipeInfoWidget(
                          widgetIcon: FontAwesomeIcons.dumbbell,
                          mainText: widget.recipeLevel,
                          subText: 'Сложность',
                          iconColor: const Color(0xff007F87),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DropdownButtonFormField<int>(
                    value: servings,
                    decoration: InputDecoration(
                      labelText: 'Порция',
                      labelStyle: const TextStyle(color: Color(0xFF1D3557)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF1D3557)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    dropdownColor: Colors.white,
                    items: List.generate(5, (index) => index + 1)
                        .map((value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text('$value'),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        servings = value!;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
                  child: Text(
                    'Ингредиенты',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ...scaledIngredients.entries.map((ingredient) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 4.0),
                    child: RecipeIngredientList(
                      recipeIngredientName: ingredient.key,
                      recipeIngredientQuantity: ingredient.value,
                    ),
                  );
                }),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
                  child: Text(
                    'Инструкции',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ...widget.recipeCookSteps.entries.map((step) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 6.0),
                    child: RecipeStepList(
                      recipeStepNum: step.key,
                      recipeStepDescription: step.value,
                    ),
                  );
                }),
                const SizedBox(height: 80.0),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0),
              child: SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeIngredientsPage(
                          recipeCardTitle: widget.recipeCardTitle,
                          recipeCardImg: widget.recipeCardImg,
                          recipeIngredients: widget.recipeIngredients,
                          recipeCookSteps: widget.recipeCookSteps,
                          servings: servings,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Начнём готовить',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeInfoWidget extends StatelessWidget {
  final IconData widgetIcon;
  final String mainText;
  final String subText;
  final Color iconColor;

  const RecipeInfoWidget({
    super.key,
    required this.widgetIcon,
    required this.mainText,
    required this.subText,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconTheme(
            data: IconThemeData(color: iconColor),
            child: Icon(
              widgetIcon,
              size: 25,
            )),
        const SizedBox(height: 8.0),
        Text(
          mainText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          subText,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class RecipeIngredientList extends StatefulWidget {
  final String recipeIngredientName;
  final String recipeIngredientQuantity;
  final bool showCheckbox;

  const RecipeIngredientList({
    super.key,
    required this.recipeIngredientName,
    required this.recipeIngredientQuantity,
    this.showCheckbox = false,
  });

  @override
  State<StatefulWidget> createState() => _RecipeIngredientListState();
}

class _RecipeIngredientListState extends State<RecipeIngredientList> {
  bool isChecked = false;

  void _toggleCheckBox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.showCheckbox) {
          _toggleCheckBox();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isChecked ? const Color(0xff1D3557) : const Color(0xffD2E7FF),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.recipeIngredientName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: isChecked ? Colors.white : Colors.black,
              ),
            ),
            Text(
              widget.recipeIngredientQuantity,
              style: TextStyle(
                fontSize: 12,
                color: isChecked ? Colors.white70 : Colors.black54,
              ),
            ),
            if (widget.showCheckbox)
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}

class RecipeStepList extends StatefulWidget {
  final String recipeStepNum;
  final String recipeStepDescription;
  final bool showCheckbox;

  const RecipeStepList({
    super.key,
    required this.recipeStepNum,
    required this.recipeStepDescription,
    this.showCheckbox = false,
  });

  @override
  State<StatefulWidget> createState() => _RecipeStepListState();
}

class _RecipeStepListState extends State<RecipeStepList> {
  bool isChecked = false;

  void _toggleCheckBox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.showCheckbox) {
          _toggleCheckBox();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isChecked ? Colors.amber : const Color(0xffD2E7FF),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          children: [
            Text(
              widget.recipeStepNum,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                widget.recipeStepDescription,
                style: const TextStyle(
                  fontSize: 14,
                ),
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (widget.showCheckbox)
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}