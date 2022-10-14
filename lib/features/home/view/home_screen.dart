import 'package:family_tree/features/member/controllers/member_provider.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  final Member member;
  const HomeScreen({required this.member, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text('hi')),
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(onPressed: () {
        print('asdf');
        context.read<FamilyTreeProvider>().findFamily('vPnBF59tTZ4h9erbuxLa'); 
      },),  
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 200,
            child: Row(
              children: [
                MemberAvatarWidget(member: member),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(), 
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      double? width = index == 0 ? 100 : null;
                      return MemberAvatarWidget(
                        width: width,
                        member: member,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20, crossAxisCount: 4, mainAxisSpacing: 20),
            itemBuilder: (_, index) => MemberAvatarWidget(
              member: member,
            ),
            itemCount: 5,
          )
        ],
      ),
    );
  }
}

class MemberAvatarWidget extends StatelessWidget {
  final double? width;
  final Member member;
  const MemberAvatarWidget({
    this.width,
    required this.member,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(member.id);
      },
      child: SizedBox(
        width: width ?? 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: SizedBox(
                      height: width ?? 60,
                      width: width ?? 60,
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdTrss4dCtYvMu4hr8pyZ31Zh3hjvTXWcrpA&usqp=CAU'))),
            ),
            Text(
              'Mohammed Riyas Tpdfsf',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
