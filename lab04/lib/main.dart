import 'student.dart';

void main() {
  var s1 = Student();
  s1.display();

  var s2 = Student.parameterized("Ali", 22);
  s2.display();

  var s3 = Student.named(studentName: "Waqar", studentAge: 25);
  s3.display();

  var s4 = Student.young("Hassan");
  s4.display();

  const s5 = Student.constant("Bilal", 30);
  s5.display();
}
