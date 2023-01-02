import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../views/persons_list_item.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  late AppCubit cubit;

  @override
  void initState() {
    cubit = AppCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          PersonsListItem(personModel: cubit.personsResponse.results[index]),
      separatorBuilder: (context, index) =>
          Row(
            children: [
              Expanded(child: Divider(height: 1.h, color: Colors.black45,))
            ],
          ),
      itemCount: cubit.personsResponse.results.length,
    );
  }
}
