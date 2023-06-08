import 'package:flutter/material.dart';

class AnswerComponent extends StatefulWidget {
  final String title;
  final bool isSelected;
  final ValueChanged<bool>? onChanged;

  const AnswerComponent({
    super.key,
    required this.title,
    required this.isSelected,
    this.onChanged,
  });

  @override
  _AnswerComponentState createState() => _AnswerComponentState();
}

class _AnswerComponentState extends State<AnswerComponent> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
            widget.onChanged?.call(_isSelected);
          });
        },
        child: Card(
          elevation: _isSelected ? 4.0 : 1.0,
          color: _isSelected ? Colors.blue : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.title,
              style: TextStyle(
                color: _isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
