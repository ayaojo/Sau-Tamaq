import 'package:flutter/material.dart';

class ChoiceChips extends StatefulWidget {

final List<ChipBtn> items;
  const ChoiceChips({
    required this.items,
    super.key,
 
  });

  @override
  State<ChoiceChips> createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return ChoiceChip(
            padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 11.0),
            showCheckmark: false,
            avatar: Image.asset(item.path),
            label: Text(
              textAlign: TextAlign.center,
              item.label,
              style: const TextStyle(
                fontSize: 14.0,
                letterSpacing: -0.04,
              ),
            ),
            selected: isSelected == index,
            labelStyle: TextStyle(
              color: isSelected == index ? Colors.white : Colors.black,
            ),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide.none,
            ),
            selectedColor: const Color(0xFF336FC5),
            backgroundColor: const Color(0xFFCDDAEC),
            onSelected: (newState) {
              setState(() {
                isSelected = index;
              });
            },
          );
        }
      ),
    );
  }
}


class ChipBtn {
  final String path;
  final String label;

  const ChipBtn(this.label, this.path);
}