import 'package:MyCareer/core/constatnt/images.dart';
import 'package:MyCareer/data/model/login.model.dart';
import 'package:MyCareer/data/model/onBoarding.model.dart';
import 'package:MyCareer/data/model/signup.model.dart';
import 'package:flutter/material.dart';

List<onBoardingModel> OnBoardingList = [
  onBoardingModel(
      title: "Find your \n dream ",
      image: images.onBoardingImage1,
      body: "Helping you Land a Job and \n Live your Dreamas .",
      button: "Let’s start"),
  onBoardingModel(
      title: "Search \n your job",
      image: images.onBoardingImage2,
      body: "search for your job right now \n from infinite opportunity",
      button: "Continue"),
  onBoardingModel(
      title: "Upload \n your CV",
      image: images.onBoardingImage3,
      body: "Upload your cv to apply the job \n vacancy in our application ",
      button: "Continue"),
  onBoardingModel(
      title: "Congratulation \n you submitted \n your job now",
      image: images.onBoardingImage4,
      body: "",
      button: "Continue"),
];

List<loginModel> loginList = [
  loginModel(
    icon: Icon(
      Icons.apple,
      color: Colors.black,
      size: 40,
    ),
  ),
  loginModel(
      icon: Icon(
    Icons.facebook,
    color: Colors.blue,
    size: 40,
  )),
];
List<login2Model> login2List = [
  login2Model(
      icon: Icon(
        Icons.email_outlined,
      ),
      label: "Email"),
  login2Model(
      icon: Icon(
        Icons.visibility,
      ),
      label: "Password"),
];

List<signupModel> signupList = [
  signupModel(
    label: "Name",
    hint: "Enter your name",
    icon: Icon(Icons.person),
  ),
  signupModel(
    label: "Email",
    hint: "Enter your email",
    icon: Icon(Icons.email),
  ),
  signupModel(
    label: "Password",
    hint: "Create a password",
    icon: Icon(Icons.visibility),
  ),
  signupModel(
    label: "Confirm Password",
    hint: "Confirm Password",
    icon: Icon(Icons.visibility),
  ),
];
