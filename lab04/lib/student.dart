import 'package:flutter/material.dart';

class Student {
  final String name;
  final int age;

  // 1. Default constructor
  Student()
   : name = "unknown",
    age = 0;


  // 2. Parameterized constructor
  Student.parameterized(this.name, this.age);

  // 3. Named constructor
  Student.named({required String studentName, required int studentAge})
  :  name = studentName,
    age = studentAge;


  // 4. Redirecting constructor
  Student.young(String studentName) : this.parameterized(studentName, 18);

  // 5. Constant constructor
  const Student.constant(this.name, this.age);

  void display() {
    print("Name: $name, Age: $age");
  }
}
