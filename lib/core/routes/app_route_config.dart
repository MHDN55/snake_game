import 'package:go_router/go_router.dart';
import '../../Features/feature/presentation/pages/home_page.dart';
import 'app_route_const.dart';

class MyAppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConst.homePage,
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),
    ],
  );
}
