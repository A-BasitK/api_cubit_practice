import 'package:api_cubit_prac/controllers/first_api/employee_data_controller_cubit.dart';
import 'package:api_cubit_prac/controllers/second_api/staff_data_controller_cubit.dart';
import 'package:api_cubit_prac/views/homepage.dart';
import 'package:api_cubit_prac/views/staff_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 912),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EmployeeDataControllerCubit>(
                create: (BuildContext context) => EmployeeDataControllerCubit()),
            BlocProvider<StaffDataControllerCubit>(
                create: (BuildContext context) => StaffDataControllerCubit()),
          ],
          child: const MaterialApp(
            home: StaffScreen(),
          ),
        );
      }
    );
  }
}
