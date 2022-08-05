import 'package:api_cubit_prac/controllers/second_api/staff_data_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({Key? key}) : super(key: key);

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {

  @override
  void initState() {
    BlocProvider.of<StaffDataControllerCubit>(context).getStaffData();
    super.initState();
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
        body:
        BlocBuilder<StaffDataControllerCubit, StaffDataControllerState>(
            builder: (context, state) {
              if(state is StaffDataControllerLoading){
                return Center(child: CircularProgressIndicator());
              }
              else if(state is StaffDataControllerLoaded){
                return Container(
                  color: Colors.lightGreen,


                  child: Center(child: Text(state.staffData.length.toString())),

                );

              }
              else if(state is StaffDataControllerException){
                return Center(child: Text(state.error));
              }
              else{
                return Center(child: Text("AAAAAAAAAAAAAAA"),);
              }

    }));
  }
}
