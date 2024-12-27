import 'package:contact_app/res/assets/image/assets_image.dart';
import 'package:contact_app/res/components/onborading/onborading_info.dart';

class OnboardingData {
  List<OnboradingInfo> item = [
    OnboradingInfo(
        title: 'Effortless Contact Management',
        description:
            'Organize your personal and professional contacts in one place. Add, edit, and manage your connections with ease.',
        image: AssetsImage.image1),
    OnboradingInfo(
        title: ' Stay Connected, Stay Organized',
        description:
            'Never lose a number again! Keep all your important contacts securely stored and quickly accessible anytime, anywhere.',
        image: AssetsImage.image2),
    OnboradingInfo(
        title: ' Your Personal Address Book',
        description:
            'Simplify your life with a smart, digital contact book. Search, sort, and save your connections effortlessly in just a few taps.',
        image: AssetsImage.image3),
  ];
}
