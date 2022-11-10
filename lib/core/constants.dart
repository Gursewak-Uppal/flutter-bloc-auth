class AppConstants {
  static String login = 'Login';
  static String login1 = 'LOGIN';
  static String home = 'Home';
  static String welcome = 'Welcome Here';
  static String loginMsg = 'Lorem Ipsum is simply dummy text of the';
  static String emailHint = 'username/email';
  static String passwordHint = 'password';
  static String problemName = 'Problem Name';
  static String className = 'Class Name';
  static String associatedBy = 'Associated By';
  static String medicineName = 'Medicine Name';
  static String medicineDose = 'Medicine Dose';
  static String medicineStrength = 'Medicine Strength';
  static String usernameRequiredMsg = 'username/email is required.';
  static String passwordRequiredMsg = 'Password is required.';
  static String passwordShortLengthMsg = 'Password length should be 6 character long.';
  static String hi = 'Hi';
  static String goodMorning = 'Good Morning';
  static String goodEvening = 'Good Evening';
  static String goodAfternoon = 'Good Afternoon';


  static String get greetingText {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return goodMorning;
    }
    if (hour < 17) {
      return goodAfternoon;
    }
    return goodEvening;
  }


}
