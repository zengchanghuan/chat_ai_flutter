import 'package:chat_app/model/models_model.dart';
import 'package:chat_app/services/api_service.dart';
import 'package:chat_app/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants/constants.dart';

class ModelsDrowDownWidget extends StatefulWidget {
  const ModelsDrowDownWidget({Key? key}) : super(key: key);

  @override
  State<ModelsDrowDownWidget> createState() => _ModelsDrowDownWidgetState();
}

class _ModelsDrowDownWidgetState extends State<ModelsDrowDownWidget> {
  String? currentModel;

  bool isFirstLoading = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelsModel>>(
        future: ApiService.getModels(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              isFirstLoading == true) {
            isFirstLoading = false;
            return const FittedBox(
              child: SpinKitFadingCircle(
                color: Colors.lightBlue,
                size: 30,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : FittedBox(
                  child: DropdownButton(
                    dropdownColor: scaffoldBackgroundColor,
                    iconEnabledColor: Colors.white,
                    items: List<DropdownMenuItem<String>>.generate(
                        snapshot.data!.length,
                        (index) => DropdownMenuItem(
                            value: snapshot.data![index].id,
                            child: TextWidget(
                              label: snapshot.data![index].id,
                              fontSize: 15,
                            ))),
                    value: currentModel,
                    onChanged: (value) {
                      setState(() {
                        currentModel = value.toString();
                      });
                      // modelsProvider.setCurrentModel(
                      //   value.toString(),
                      // );
                    },
                  ),
                );
        });
  }

}
