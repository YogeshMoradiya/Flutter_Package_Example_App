import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class User {
  final String name;
  final String imageUrl;
  final String email;

  User({required this.name, required this.imageUrl, required this.email});
}

final allusers = [
  User(
      name: 'Ruby J Semis',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'destiny_bogisi@hotmail.com'),
  User(
      name: 'Alberta B Hartman',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'brennon1971@hotmail.com'),
  User(
      name: 'Cassandra J Gonzales',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'wendy.leann@hotmail.com'),
  User(
      name: 'Pedro D Adams',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'sanford.wilderm@yahoo.com'),
  User(
      name: 'James P Allen',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'granville.upt@hotmail.com'),
  User(
      name: 'Peter N Brown',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'vivien1977@yahoo.com'),
  User(
      name: 'Allison N Gray',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'archibald.nien@gmail.com'),
  User(
      name: 'Shannon A Mayer',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'nathanael1995@gmail.com'),
  User(
      name: 'Johnny K Kaplan',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'ebba1998@hotmail.com'),
  User(
      name: 'Marion T Jackson',
      imageUrl:
          'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
      email: 'crystal2012@yahoo.com'),
];

enum Actions { share, delete, archive }

class FlutterSlidableWidget extends StatefulWidget {
  const FlutterSlidableWidget({super.key});

  @override
  State<FlutterSlidableWidget> createState() => _FlutterSlidableWidgetState();
}

class _FlutterSlidableWidgetState extends State<FlutterSlidableWidget> {
  List<User> users = allusers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slidable widget'),
        backgroundColor: Colors.grey,
      ),
      body: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            return Slidable(
              key: Key(user.name),
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () => _onDismissed(index, Actions.share),
                ),
                children: [
                  SlidableAction(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                    onPressed: (context) => _onDismissed(index, Actions.share),
                  ),
                  SlidableAction(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'archive',
                    onPressed: (context) =>
                        _onDismissed(index, Actions.archive),
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const BehindMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () => _onDismissed(index, Actions.delete),
                ),
                children: [
                  SlidableAction(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                    onPressed: (context) => _onDismissed(index, Actions.delete),
                  ),
                ],
              ),
              child: buildUserListTile(user),
            );
          },
        ),
      ),
    );
  }

  void _onDismissed(int index, Actions action) {
    final user = users[index];
    setState(() => users.removeAt(index));

    switch (action) {
      case Actions.delete:
        _showSnackBar(context, '${user.name}is deleted', Colors.red);
        break;
      case Actions.archive:
        _showSnackBar(context, '${user.name}is archive', Colors.blue);
        break;
      case Actions.share:
        _showSnackBar(context, '${user.name}is shared', Colors.green);
        break;
    }
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildUserListTile(User user) => Builder(
        builder: (context) => ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(user.name),
          subtitle: Text(user.email),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(user.imageUrl),
          ),
          onTap: () {
            final slidable = Slidable.of(context)!;
            final isClosed =
                slidable.actionPaneType.value == ActionPaneType.none;
            if (isClosed) {
              slidable.openStartActionPane();
            } else {
              slidable.close();
            }
          },
        ),
      );
}