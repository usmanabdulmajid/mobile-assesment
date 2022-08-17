class Validator {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return ('Email can\'t be empty');
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Password can\'t be empty';
    }
    if (password.length < 7) {
      return 'Enter valid password(min. 7 Character)';
    }
    return null;
  }

  String? validateName(String? name) {
    if (name!.isEmpty) {
      return 'Name field can\'t be empty';
    }
    return null;
  }
}
