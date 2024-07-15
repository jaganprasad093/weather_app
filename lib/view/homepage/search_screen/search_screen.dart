import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/color_constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController SearchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor,
        title: Text(
          "Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
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
                  controller: SearchController,
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
            ],
          ),
        ),
      ),
    );
  }
}
