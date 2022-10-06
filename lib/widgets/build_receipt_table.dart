import 'package:demo_version_web/models/title_and_info_model.dart';
import 'package:flutter/material.dart';

Column buildReceiptTable(BuildContext context,List<TitleAndInfoModel> titleAndInfos) {
    return Column(
      children: titleAndInfos
          .map((model) => ListTile(
                leading: Text(
                  model.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                title: Text(
                  model.info,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ))
          .toList(),
    );
  }