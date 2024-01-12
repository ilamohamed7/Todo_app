import 'package:flutter/material.dart';
import 'package:todoapp/widgets/CustomBottomSheet.dart';

class CustomFloatingButtom extends StatelessWidget {
  const CustomFloatingButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20),
                child: CustomBottomSheet(),
              ),
            );
          },
          child: const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.add,
              size: 36,
              color: Colors.black,
            ),
          ),
        ));
  }
}
