import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../common/widgets/dialogs/error_dialog.dart';
import '../../../common/widgets/main_drawer.dart';
import '../../../config/router/router_paths.dart';
import '../../../models/core/user.dart';
import '../../core/auth/bloc/auth_cubit.dart';
import '../bloc/home_screen_cubit.dart';
import '../bloc/home_screen_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<HomeScreenCubit>().fetchUsers());
  }

  List<int> lista = [10, 20, 50, 100, 200, 1000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context, listen: false).logOut();
            // GoRouter.of(context).go('/login');
          },
        ),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<HomeScreenCubit, HomeScreenState>(listener: (context, state) {
            if (state.status == HomeScreenStatus.error) {
              showDialog(
                context: context,
                builder: (context) => ErrorDialog(content: AppLocalizations.of(context).something_went_wrong),
              );
            }
          }, builder: (context, state) {
            if (state.userList == null) {
              return const Center(
                child: Text("There is no data here!"),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.userList?.entries.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      GoRouter.of(context).push('${RouterPaths.detail}+$index');
                    },
                    child: Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.userList!.entries[index].username!,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                             Text( AppLocalizations.of(context).description),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ));
  }
}
