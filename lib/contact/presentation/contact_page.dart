import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_crud/contact/shared/contact_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactNotifierProvider);
    ref.listen(
      contactNotifierProvider,
      (previous, next) {
        next.when(
          initial: () => debugPrint('contactNotifierProvider/ initial'),
          loading: () => debugPrint('contactNotifierProvider/ loading'),
          noConnection: () =>
              debugPrint('contactNotifierProvider/ noConnection'),
          empty: () => debugPrint('contactNotifierProvider/ empty'),
          success: (data) {
            debugPrint('contactNotifierProvider/ success');
            debugPrint('contactNotifierProvider/ $data');
          },
          error: (error) => debugPrint('contactNotifierProvider/ error'),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample CRUD'),
      ),
      body: state.when(
        initial: () => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        noConnection: () => const Center(
          child: Text('No Connection\nCheck your internet!'),
        ),
        empty: () => const Center(
          child: Text('No Data'),
        ),
        success: (contacts) => ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].phone),
            ),
          ),
        ),
        error: (error) => const Center(
          child: Text('Error/nSomething wrong'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(contactRemoteServiceProvider).getContacts();
          ref.read(contactNotifierProvider.notifier).getContacts();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
