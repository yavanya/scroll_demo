import 'package:datafolks_demo/models/reset.dart';
import 'package:datafolks_demo/ui/home/homeviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return model.isBusy
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                body: SafeArea(child: _demoWidget(context, model)),
              );
      },
    );
  }
}

Widget _demoWidget(BuildContext context, HomeViewModel model) {
  return SizedBox(
    height: 60,
    child: Stack(
      alignment: Alignment.centerRight,
      children: [
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.options.optionsList.length,
          itemBuilder: (context, index) {
            var _temp = model.options.optionsList[index];
            return GestureDetector(
              onTap: () {
                model.changeOptions(index);
                Reset.isActive = true;
              },
              child: Container(
                margin: EdgeInsets.all(8),
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: _temp.colors[1], width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: _temp.color),
                child: Center(
                  child: Text(
                    _temp.name,
                    style: TextStyle(
                        color:
                            _temp.isActive ? _temp.colors[0] : _temp.colors[1]),
                  ),
                ),
              ),
            );
          },
        ),
        Reset.isActive
            ? GestureDetector(
                onTap: () {
                  model.resetOptions();
                  Reset.isActive = false;
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffD4455D)),
                  child: Center(
                    child: Text(
                      Reset.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    ),
  );
}
