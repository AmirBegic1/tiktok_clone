import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  Comments({Key? key}) : super(key: key);
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage('profilePhotos'),
                        ),
                        title: Row(
                          children: [
                            Text(
                              'username',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'komentara',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              'date',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '10 likes,',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: commentController,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Comment: ',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                trailing: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ),
              //NAPRAVIT DA JE ONO DO POLA SKRINA
            ],
          ),
        ),
      ),
    );
  }
}
