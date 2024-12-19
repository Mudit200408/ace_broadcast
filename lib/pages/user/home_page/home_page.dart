import 'package:ace_broadcast/model/post_model.dart';
import 'package:ace_broadcast/utils/constant.dart';
import 'package:ace_broadcast/widgets/appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ace_broadcast/widgets/post_widget/post_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> posts = [
    {
      'avatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ659jzkAAU026hHkvUYOgQxAB6rdeXeehAHw&s',
      'userName': 'Student Council AGI',
      'postTitle': 'Join the Student Council - We\'re Hiring!',
      'time': '19h',
      'postImage':
          'https://atharvacoe.ac.in/wp-content/uploads/WhatsApp-Image-2023-04-18-at-11.56.41-AM.jpeg',
      'description':
          "Are you passionate about making a difference? The Student Council is looking for enthusiastic individuals to join our team. Apply now to become a part of the leadership that drives change on campus!",
      'likesCount': '450',
      'commentsCount': '27',
      'shareCount': '69',
      'applicablePost': true,
    },
    {
      'avatar':
          'https://media.licdn.com/dms/image/v2/C560BAQHxmwOoa4S_Hw/company-logo_200_200/company-logo_200_200/0/1630644046620?e=2147483647&v=beta&t=bCKpnQxte9Qu24WACerGOHS4clIuZnqV-iRgS1NnGSc',
      'userName': 'GDGC ACE',
      'postTitle': 'Hackathon 2024 - Innovation Unleashed!',
      'time': '23m',
      'postImage': null,
      'description':
          "Gear up for an exciting 24-hour coding marathon! GDGC ACE invites tech enthusiasts to showcase their creativity and problem-solving skills at Hackathon 2023. Amazing prizes await! Register now!",
      'likesCount': '24',
      'commentsCount': '3',
      'shareCount': '14',
      'applicablePost': false,
    },
    {
      'avatar': 'https://www.mgsmasc.ac.in/images/nss.jpg',
      'userName': 'NSS Atharva',
      'postTitle': 'Join NSS Atharva for Beach Cleanup Drive',
      'time': '2d',
      'postImage':
          'https://swastikanationalschool.edu.in/wp-content/uploads/2024/02/WhatsApp-Image-2024-01-09-at-3.57.39-PM-1024x1011.jpeg',
      'description':
          "Let's make a difference together! NSS Atharva invites volunteers for our beach cleaning drive this weekend. Join us in creating a cleaner and greener coastline for everyone.",
      'likesCount': '32',
      'commentsCount': '300',
      'shareCount': '150',
      'applicablePost': true,
    },
    {
      'avatar':
          'https://media.licdn.com/dms/image/v2/C4D0BAQEeyY_lBDC2Ng/company-logo_200_200/company-logo_200_200/0/1630510254043?e=2147483647&v=beta&t=H2MLdI-OA-xT4c-uAuV6yGKu4KeD2hsMjCS1O9cQlHI',
      'userName': 'TEDxACE',
      'postTitle': 'TEDxACE Seminar - Ideas Worth Spreading!',
      'time': '4h',
      'postImage': null,
      'description':
          "Get ready for an inspiring day of talks and discussions! TEDxACE is back with a new edition of our seminar series. Stay tuned for more updates!",
      'likesCount': '88',
      'commentsCount': '15',
      'shareCount': '25',
      'applicablePost': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context, 'ACE Broadcast', showCalendarIcon: true),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: [
            const SizedBox(height: 25),
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayInterval: const Duration(seconds: 10),
              ),
              items: carouselImages.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 25),
            // Posts List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                color: Theme.of(context).colorScheme.surfaceDim,
                thickness: 0.3,
                height: 10,
                indent: 5,
                endIndent: 5,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final postData = posts[index];
                final post = PostModel.fromMap(postData);
                return PostWidget(post: post);
              },
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Your All, \nCaught Up!",
                style: GoogleFonts.doHyeon(
                  color:
                      Theme.of(context).colorScheme.surfaceDim.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.3,
                  fontSize: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
