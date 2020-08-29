const String emptyPasswordError = "Please enter password";
const String shortPasswordError = "Password should contain at least 8 characters";
const String emptyEmailError = "Please enter email";
const String invalidEmailFormatError = "Email is invalid";
const String confirmPasswordError = "Passwords are not the same";

final RegExp emailRegex =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
