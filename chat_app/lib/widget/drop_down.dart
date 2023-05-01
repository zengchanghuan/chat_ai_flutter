import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ModelsDrowDownWidget extends StatefulWidget {
  const ModelsDrowDownWidget({Key? key}) : super(key: key);

  @override
  State<ModelsDrowDownWidget> createState() => _ModelsDrowDownWidgetState();
}

class _ModelsDrowDownWidgetState extends State<ModelsDrowDownWidget> {
  String currentModel = "Model1";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        dropdownColor: scaffoldBackgroundColor,
        iconEnabledColor: Colors.white,
        value: currentModel,
        items: getModelsItem,
        onChanged: (value) {
          setState(() {
            currentModel = value.toString();
          });
        });
  }
}


