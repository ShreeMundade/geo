import 'package:firebase_database/firebase_database.dart';

import 'office.dart';

enum Gender { Male, Female, Other }

enum SkillCategory { Unskilled, Skilled }

enum EmployeeFunction { Student, Teacher, Principle }

enum EmployeeSubFunction { person }

enum Grade { a, b, c, d, e, f }

enum Designation { head,associate, learner }

enum Nationality { INDIAN, CANADIAN }

enum MaritalStatus {
  Unmarried,
  Married,
  ItsComplicated,
}

enum Religion { Buddhism, Christianity, Hinduism, Islam, Jainism, Other }

enum Entity { entity }

enum BloodGroup {
  A_positive,
  A_negative,
  B_positive,
  B_negative,
  AB_positive,
  O_positive,
  O_negative
}

enum EmployeeType { Trainee, Manager }

enum Role { student, admin }

class Employee {
  String uID = '';
  String employeeID;
  String firstName;
  String? middleName;
  String? lastName;
  String? officeEmail;
  String? alternateEmail;
  String contactNumber = '';
  DateTime? dateOfBirth;
  DateTime? joiningDate;
  String residentialAddress = '';
  Gender? gender;
  int? retirementAge;

  Office? joiningUnit;
  SkillCategory? skillCategory;

  EmployeeFunction? employeeFunction;
  EmployeeSubFunction? employeeSubFunction;

  Grade? grade;
  String designation;

  MaritalStatus? maritalStatus;
  Religion? religion;

  Nationality? nationality;

  Entity? entity;
  BloodGroup? bloodGroup;

  EmployeeType? employeeType;
  Employee? reviewPerson;

  Role? role;

  Employee({
    required this.employeeID,
    required this.firstName,
    this.middleName,
    this.lastName,
    required this.residentialAddress,
    required this.contactNumber,
    this.officeEmail,
    this.alternateEmail,
    this.dateOfBirth,
    this.joiningDate,
    this.gender,
    this.retirementAge,
    this.joiningUnit,
    this.skillCategory,
    this.employeeFunction,
    this.employeeSubFunction,
    this.grade,
    required this.designation,
    this.maritalStatus,
    this.religion,
    this.nationality,
    this.entity,
    this.bloodGroup,
    this.employeeType,
    this.reviewPerson,
    this.role,
  });

  Employee.fromSnapshot(DataSnapshot snapshot)
      : uID = (snapshot.value as Map)["UID"],
        employeeID = (snapshot.value as Map)["employeeID"],
        firstName = (snapshot.value as Map)["firstName"],
        middleName = (snapshot.value as Map)["middleName"],
        lastName = (snapshot.value as Map)["lastName"],
        officeEmail = (snapshot.value as Map)["officeEmail"],
        alternateEmail = (snapshot.value as Map)["alternateEmail"],
        dateOfBirth = (snapshot.value as Map)["dateOfBirth"],
        joiningDate = (snapshot.value as Map)["joiningDate"],
        gender = (snapshot.value as Map)["gender"],
        retirementAge = (snapshot.value as Map)["retirementAge"],
        joiningUnit = (snapshot.value as Map)["joiningUnit"],
        skillCategory = (snapshot.value as Map)["skillCategory"],
        employeeFunction = (snapshot.value as Map)["employeeFunction"],
        employeeSubFunction = (snapshot.value as Map)["employeeSubFunction"],
        grade = (snapshot.value as Map)["grade"],
        designation = (snapshot.value as Map)["designation"],
        maritalStatus = (snapshot.value as Map)["maritalStatus"],
        religion = (snapshot.value as Map)["religion"],
        nationality = (snapshot.value as Map)["nationality"],
        entity = (snapshot.value as Map)["entity"],
        bloodGroup = (snapshot.value as Map)["bloodGroup"],
        employeeType = (snapshot.value as Map)["employeeType"],
        reviewPerson = (snapshot.value as Map)["reviewPerson"],
        role = (snapshot.value as Map)["role"];

  toJson() {
    return {
      "employeeID": employeeID,
      "firstName": firstName,
      "middleName": middleName,
      "lastName": lastName,
      "officeEmail": officeEmail,
      "alternateEmail": alternateEmail,
      "dateOfBirth": dateOfBirth,
      "joiningDate": joiningDate,
      "gender": gender,
      "retirementAge": retirementAge,
      "joiningUnit": joiningUnit,
      "skillCategory": skillCategory,
      "employeeFunction": employeeFunction,
      "employeeSubFunction": employeeSubFunction,
      "grade": grade,
      "designation": designation,
      "maritalStatus": maritalStatus,
      "religion": religion,
      "nationality": nationality,
      "entity": entity,
      "bloodGroup": bloodGroup,
      "employeeType": employeeType,
      "reviewPerson": reviewPerson,
      "role": role,
    };
  }
}
