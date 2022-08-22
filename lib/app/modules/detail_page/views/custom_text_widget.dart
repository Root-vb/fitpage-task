import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:starter/app/data/models/dto/base_data.dart';
import 'package:starter/app/modules/indicator_view/views/indicator_view_view.dart';
import 'package:starter/app/modules/variable_list/views/variable_list_view.dart';
import 'package:starter/app/theme/styles.dart';

class CustomText extends StatelessWidget {
  final HomeData data;

  const CustomText({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: data.criteria.length,
      separatorBuilder: (context, index) => ListTile(
        title: RichText(
          text: const TextSpan(
              text: "and", style: TextStyle(color: Colors.white)),
        ),
      ),
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          text: TextSpan(
              children: _parseText(data.criteria[index]),
              style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  List<InlineSpan> _parseText(Criteria criteria) {
    final widgets = <InlineSpan>[];
    final text = criteria.text;

    if (criteria.type == "plain_text") {
      widgets.add(_textSpanWithoutAction(text));
    } else if (criteria.type == "variable") {
      var indexes = <int>[];

      final variables = <TextEntity>[];

      criteria.variable?.keys.forEach((key) {
        final startIndex = text.lastIndexOf(key);
        final endIndex = startIndex + key.length - 1;
        indexes.addAll({startIndex, endIndex});
        variables.add(TextEntity(
          startIndex: startIndex,
          endIndex: endIndex,
          data: criteria.variable![key]!,
        ));
      });

      indexes.add(text.length);

      indexes = indexes.toSet().toList();

      indexes.sort((a, b) => a.compareTo(b));

      int index = 0;
      for (var i = 0; i < indexes.length; i++) {
        int startIndex = index;
        int endIndex = indexes[i];

        if (i % 2 != 0) {
          endIndex++;
        }

        // for first and last
        if (startIndex == endIndex) {
          if (indexes.length == i + 1) {
            endIndex = text.length;
          } else {
            endIndex = indexes[i + 1];
            if ((i + 1) % 2 != 0) {
              endIndex++;
            }
          }
        }

        if (indexes.contains(startIndex)) {
          if (indexes.indexOf(startIndex) % 2 == 0) {
            variables.forEach((element) {
              if (element.startIndex == startIndex) {
                widgets.add(_textSpan(_getValue(element.data), element.data));
              }
            });
          } else {
            widgets.add(
                _textSpanWithoutAction(text.substring(startIndex, endIndex)));
          }
        } else {
          widgets.add(
              _textSpanWithoutAction(text.substring(startIndex, endIndex)));
        }

        index = endIndex;
      }
    }
    return widgets;
  }

  InlineSpan _textSpanWithoutAction(String text) {
    return TextSpan(
      text: text,
      style: Styles.tsWhiteRegular16,
    );
  }

  InlineSpan _textSpan(String text, VariableData data) {
    return TextSpan(
      text: text,
      style: Styles.tsBlueRegular16,
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          if (data.type == "value") {
            VariableListView.launch(data: data);
          } else {
            IndicatorViewView.launch(data: data);
          }
        },
    );
  }

  String _getValue(VariableData data) {
    var text = "";
    if (data.type == "value") {
      text = data.values!.first.toString();
    } else if (data.type == "indicator") {
      text = data.defaultValue!.toString();
    }
    return "($text)";
  }
}

class TextEntity {
  final int startIndex;
  final int endIndex;
  final VariableData data;

  TextEntity({
    required this.startIndex,
    required this.endIndex,
    required this.data,
  });
}
