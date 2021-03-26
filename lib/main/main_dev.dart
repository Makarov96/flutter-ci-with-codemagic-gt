import '../core/utils/config/enviorments.dart';
import '../main_common.dart';

Future<void> main() async {
  await mainCommon(Env.dev);
}
