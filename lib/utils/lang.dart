import 'package:get/get.dart';

class LanguageString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'sign_in': 'Sign In',
          'gmail': 'Gmail',
          'login': 'Log In',
          'password': 'Password',
          'info': 'Info'
        },
        'mm_MY': {
          'sign_in': 'ဆိုင်းအင်လုပ်ခြင်း',
          'gmail': 'မေးလ်လိပ်စာ',
          'password': 'လျှို့၀ှက်စကားလုံး',
          'login': '၀င်ရန်',
          'info': 'အကြောင်း'
        }
      };
}
