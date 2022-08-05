import 'package:api_cubit_prac/models/first_data_model/api_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:api_cubit_prac/models/repo/first_repo/employee_repo.dart';

part 'employee_data_controller_state.dart';

class EmployeeDataControllerCubit extends Cubit<EmployeeDataControllerState> {
  EmployeeDataControllerCubit() : super(EmployeeDataControllerInitial());

  getEmployeeData() async {

//    emit(EmployeeDataControllerLoading());

    try {
      emit(EmployeeDataControllerLoading());

      final data = await Repo.getEmployeeData();

      if(data != null){
        emit(EmployeeDataControllerLoaded(datum: data));
      }else{
        emit(EmployeeDataControllerException(error: ""));
      }

      //emit(EmployeeDataControllerLoaded(employeeData: data!));
    } catch (e) {
      emit(EmployeeDataControllerException(error: e.toString()));
    }
  }
}
