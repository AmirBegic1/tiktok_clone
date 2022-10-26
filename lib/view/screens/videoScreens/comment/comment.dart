import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/comment_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

// ignore: must_be_immutable
class Comments extends StatelessWidget {
  final String id;
  Comments({Key? key, required this.id}) : super(key: key);
  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updateIdOdPosta(id);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Comments"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height - 100,
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () {
                      return ListView.builder(
                        itemCount: commentController.comments.length,
                        itemBuilder: (context, index) {
                          final comments = commentController.comments[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  NetworkImage(comments.profilePicture),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  comments.username,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  comments.comment,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  timeago.format(
                                    comments.date.toDate(),
                                  ),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '10 likes',
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
                        },
                      );
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  title: TextFormField(
                    controller: _commentController,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: const InputDecoration(
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
                      onPressed: () => commentController
                          .postComment(_commentController.text),
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
      ),
    );
  }
}
