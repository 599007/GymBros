import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget{
  final String text;

  const MyCheckBox({
    super.key,
    required this.text});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
    bool isCheckedMale = false;
    

    @override
    Widget build(BuildContext context){
        return 
          Container(
            width: 195,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: CheckboxListTile(
                    title: Text(widget.text),
                    activeColor: Colors.grey.shade200,
                    checkColor: Colors.black,
                    tileColor: Colors.grey.shade200,
                    controlAffinity: ListTileControlAffinity.leading,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: isCheckedMale ? Colors.grey.shade400 : Colors.white
                      ),
                      borderRadius: BorderRadius.circular(2000.0)
                      ),
                    value: isCheckedMale,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isCheckedMale = newValue!;
                      });
                    }),
            ),
          );
    }
}

