import 'package:ace_broadcast/model/event_category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _postController = TextEditingController();
  int _charCount = 0;
  DateTime? _selectedDate;

  Category selectedCategory = Category(
    index: 0,
    name: 'Select an option',
    icon: Icons.add,
    color: Colors.grey,
  );

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _postController.addListener(_validateInput);
    _postController.addListener(() {
      setState(() {
        _charCount = _postController.text.length;
      });
    });
  }

  void _validateInput() {
    setState(() {
      isButtonEnabled = _postController.text.trim().isNotEmpty &&
          selectedCategory.name != 'Select an option' &&
          _selectedDate != null;
    });
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, size: 25),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: isButtonEnabled
                  ? () {
                      // Post content logic
                      print(
                          "Post Submitted: ${_postController.text} \nCategory: ${selectedCategory.name}");
                      Navigator.of(context).pop();
                    }
                  : null,
              child: Container(
                width: 75,
                height: 35,
                decoration: BoxDecoration(
                  color: isButtonEnabled
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey, // Grey when disabled
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Post',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://avatarfiles.alphacoders.com/375/thumb-1920-375791.jpeg'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            categorySelectBottomBar(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: selectedCategory.color, width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  selectedCategory.icon,
                                  color: selectedCategory.color,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  selectedCategory.name,
                                  style: GoogleFonts.lato(
                                    color: selectedCategory.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 60)),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  _selectedDate = pickedDate;
                                });
                              }
                            },
                            child: Text(
                              _selectedDate != null
                                  ? DateFormat('dd MMM').format(_selectedDate!)
                                  : 'Select Last Date',
                              style: GoogleFonts.lato(
                                  color:
                                      Theme.of(context).colorScheme.surfaceDim,
                                  fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 10),
                      child: Text(
                        _charCount > 250 ? "$_charCount/280" : "",
                        style: GoogleFonts.lato(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65, top: 10),
                  child: TextField(
                    controller: _postController,
                    maxLength: 280,
                    maxLines: 18,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Describe your team needs…',
                      hintStyle: GoogleFonts.lato(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                      counterText: '',
                      isDense: true,
                    ),
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> categorySelectBottomBar(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: categories.map((category) {
              return ListTile(
                leading: Icon(category.icon, color: category.color),
                title: Text(category.name),
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                  Navigator.pop(context);
                  _validateInput();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
