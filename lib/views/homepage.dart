import 'package:api_cubit_prac/controllers/first_api/employee_data_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<EmployeeDataControllerCubit>(context).getEmployeeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('HomePage')),
      body:
          BlocBuilder<EmployeeDataControllerCubit, EmployeeDataControllerState>(
              builder: (context, state) {
        if (state is EmployeeDataControllerLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is EmployeeDataControllerLoaded) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
              itemCount: state.datum.length,
              itemBuilder: (context, index) {

              var data = state.datum[index];
                return Container(

                  height: 200.h,
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                            child: Text(
                        data.firstName,
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                          )),
                    ],
                  ),
                );
              });
        } else {
          return Container();
        }
      }),
    );
  }
}
