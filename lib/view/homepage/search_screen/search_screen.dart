import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/search_controller.dart';
import 'package:weather_app/core/constants/color_constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    initload();
    super.initState();
  }

  void initload() async {
    // var provider = context.read<SearchScreenController>();
    // var current_position = provider.formattedAddress;
    // await context.read<SearchScreenController>().addSearch(current_position);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _SearchController = TextEditingController();
    String text = "could not fetch the looation";
    var prov = context.read<SearchScreenController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor,
        title: Text(
          "Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await context
                      .read<SearchScreenController>()
                      .addSearch("${_SearchController.text}");
                  log("search progressing");
                  log("res model---- ${prov.resmodel}");

                  if (prov.res_null == null) {
                    log("if case: resmodel is null");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("city not found")));
                    return log(text);
                  } else {
                    log("else case: resmodel is not null");
                    if (Navigator.canPop(context)) {
                      log("Navigator can pop: true");
                      Navigator.pop(context);
                    } else {
                      log("Navigator can pop: false");
                    }
                  }
                }
              },
              child: Icon(Icons.check)),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextFormField(
                  controller: _SearchController,
                  decoration: const InputDecoration(
                    labelText: 'Edit search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? 'Please search something'
                        : null;
                  },
                ),
              ),
              Text(prov.resmodel == null ? text : "search locations")
            ],
          ),
        ),
      ),
    );
  }
}
