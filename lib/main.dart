import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<Employee> _employees = <Employee>[];

final EmployeeDataSource _employeeDataSource = EmployeeDataSource();

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    populateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: SfDataGrid(
        source: _employeeDataSource,
        allowSorting: true,
        columns: <GridColumn>[
          GridNumericColumn(mappingName: 'id', headerText: 'ID'),
          GridTextColumn(mappingName: 'name', headerText: 'Name'),
          GridTextColumn(mappingName: 'designation', headerText: 'Designation'),
          GridNumericColumn(mappingName: 'salary', headerText: 'Salary'),
        ],
      ),
    );
  }

  void populateData() {
    _employees.add(Employee(10001, 'James', 'Project Lead', 20000));
    _employees.add(Employee(10002, 'Kathryn', 'Manager', 30000));
    _employees.add(Employee(10003, 'Lara', 'Developer', 15000));
    _employees.add(Employee(10004, 'Michael', 'Designer', 15000));
    _employees.add(Employee(10005, 'martin', 'Developer', 15000));
    _employees.add(Employee(10006, 'newberry', 'Developer', 15000));
    _employees.add(Employee(10007, 'Balnc', 'Developer', 15000));
    _employees.add(Employee(10008, 'Perry', 'Developer', 15000));
    _employees.add(Employee(10009, 'Gable', 'Developer', 15000));
    _employees.add(Employee(10010, 'grimes', 'Developer', 15000));
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);

  final int id;

  final String name;

  final String designation;

  final int salary;
}

class EmployeeDataSource extends DataGridSource<Employee> {
  @override
  List<Employee> get dataSource => _employees;

  @override
  Object getValue(Employee employee, String columnName) {
    switch (columnName) {
      case 'id':
        return employee.id;
        break;
      case 'name':
        return employee.name;
        break;
      case 'salary':
        return employee.salary;
        break;
      case 'designation':
        return employee.designation;
        break;
      default:
        return ' ';
        break;
    }
  }

  @override
  int compare(Employee a, Employee b, SortColumnDetails sortColumn) {
    if (sortColumn.name == 'name') {
      if (sortColumn.sortDirection == DataGridSortDirection.ascending) {
        if (a.name == null || b.name == null)
          return a.name == null ? -1 : 1;
        else
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      } else {
        if (a.name == null || b.name == null)
          return a.name == null ? 1 : -1;
        else
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
      }
    }
    return super.compare(a, b, sortColumn);
  }
}
