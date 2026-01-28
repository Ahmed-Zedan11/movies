class Validator {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your email";
    }
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your password";
    }
    if (!RegExp(r'^(?=.*\d)(?=.*[!@#$%^&*]).{7,}$').hasMatch(value)) {
      return "Password must be at least 7 characters long and include at least one number and one special character";
    }
    return null;
  }

  static String? validateRePassword(String? value, String? password) {
    if (value == null || value.trim().isEmpty) {
      return "Please confirm your password";
    }
    if (value != password) {
      return "Passwords do not match";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your phone number";
    }
    if (!RegExp(r'^01\d{9}$').hasMatch(value)) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  static String? validateLoginName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your name";
    }
    if (!RegExp(r'^emilys$').hasMatch(value)) {
      return "Hint: Name is emilys";
    }

    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your Password";
    }

    if (!RegExp(r'^emilyspass$').hasMatch(value)) {
      return "Hint: Password is emilyspass";
    }

    return null;
  }
}
