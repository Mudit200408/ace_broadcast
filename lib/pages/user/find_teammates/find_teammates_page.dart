import 'package:ace_broadcast/model/event_category.dart';
import 'package:ace_broadcast/pages/user/find_teammates/create_post_team.dart';
import 'package:ace_broadcast/widgets/appbar.dart';
import 'package:ace_broadcast/widgets/floating_action_btn.dart';
import 'package:flutter/material.dart';
import 'package:ace_broadcast/widgets/teammates_find_post/team_post.dart';

class FindTeammatesPage extends StatefulWidget {
  const FindTeammatesPage({super.key});

  @override
  State<FindTeammatesPage> createState() => _FindTeammatesPageState();
}

class _FindTeammatesPageState extends State<FindTeammatesPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> posts = [
    {
      'opName': 'Arthur Morgan',
      'opProfile':
          'https://static.wikia.nocookie.net/reddeadredemption/images/5/52/RDR2_Arthur_Morgan_Default.jpg',
      'lastDate': '25th Dec',
      'categoryId': 1,
      'postDescription':
          'Looking for a teammate to participate in the upcoming coding hackathon at college. Must be proficient in Python and have experience with data structures. Let’s bring home the trophy!',
      'onApply': () {},
    },
    {
      'opName': 'John Marston',
      'opProfile':
          'https://static.wikia.nocookie.net/reddeadredemption/images/a/ac/JohnMarstonSr.1899.jpg',
      'lastDate': '30th Dec',
      'categoryId': 4,
      'postDescription':
          'Seeking a creative partner for a live mural art competition. If you love painting and want to showcase your talent in front of a crowd, join me in making something amazing!',
      'onApply': () {},
    },
    {
      'opName': 'Hosea Matthews',
      'opProfile':
          'https://static.wikia.nocookie.net/reddeadredemption/images/d/d1/Hosea_injured.jpg',
      'lastDate': '28th Dec',
      'categoryId': 6,
      'postDescription':
          'Calling all gaming enthusiasts! Need a partner for a Valorant showdown at the esports competition. Bring your A-game and let’s dominate the leaderboards together!',
      'onApply': () {},
    },
    {
      'opName': 'Sadie Adler',
      'opProfile':
          'https://static.wikia.nocookie.net/reddeadredemption/images/c/c2/Sadie_adler.png',
      'lastDate': '27th Dec',
      'categoryId': 7,
      'postDescription':
          'Looking for a teammate for the entrepreneurship pitch contest. If you’re good at business strategies and presentations, join me in crafting a winning idea!',
      'onApply': () {},
    },
    {
      'opName': 'Charles Smith',
      'opProfile':
          'https://static.wikia.nocookie.net/reddeadredemption/images/e/e7/Charles.jpg',
      'lastDate': '31st Dec',
      'categoryId': 2,
      'postDescription':
          'Want to team up for the college carnival event? I’m planning something fun and festive with creative games and activities. Let’s make it the highlight of the fest!',
      'onApply': () {},
    },
  ];

  Category? selectedCategory;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _openCreatePost() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreatePostPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Find Teammates"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Header Section
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 250,
            //     child: Row(
            //       children: [
            //         Expanded(
            //           flex: 4,
            //           child: Container(
            //             margin: const EdgeInsets.only(right: 8),
            //             decoration: BoxDecoration(
            //               color: Colors.grey.shade700,
            //               borderRadius: BorderRadius.circular(12),
            //             ),
            //             child: const Center(
            //               child: Text(
            //                 "Show calendar",
            //                 style: TextStyle(color: Colors.white, fontSize: 20),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Expanded(
            //           flex: 3,
            //           child: Column(
            //             children: [
            //               Expanded(
            //                 flex: 4,
            //                 child: Container(
            //                   margin: const EdgeInsets.only(bottom: 8),
            //                   decoration: BoxDecoration(
            //                     color: Colors.grey.shade800,
            //                     borderRadius: BorderRadius.circular(12),
            //                   ),
            //                   child: const Center(
            //                     child: Text(
            //                       "Applications received",
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(
            //                           color: Colors.white, fontSize: 20),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               Expanded(
            //                 flex: 3,
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     color: Colors.grey.shade900,
            //                     borderRadius: BorderRadius.circular(12),
            //                   ),
            //                   child: const Center(
            //                     child: Text(
            //                       "No. of applications you applied for",
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(
            //                           color: Colors.white, fontSize: 16),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(height: 15),
            // Categories Section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  const SizedBox(width: 19),
                  Row(
                    children: categories.map((category) {
                      final isSelected = selectedCategory == category;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = isSelected ? null : category;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? category.color
                                : Colors.transparent,
                            border:
                                Border.all(color: category.color, width: 1.8),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                category.icon,
                                color:
                                    isSelected ? Colors.white : category.color,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                category.name,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : category.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(width: 20)
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Posts Section
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                color: Theme.of(context).colorScheme.surfaceDim,
                thickness: 0.3,
                height: 10,
                indent: 25,
                endIndent: 25,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return FindTeamPostWidget(
                  opName: post['opName'],
                  opProfile: post['opProfile'],
                  lastDate: post['lastDate'],
                  categoryId: post['categoryId'],
                  postDescription: post['postDescription'],
                  onApply: post['onApply'],
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: RotatingFloatingActionButton(onPressed: _openCreatePost),
      ),
    );
  }
}
