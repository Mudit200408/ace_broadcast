});

  @override
  State<FindTeamPostWidget> createState() => _FindTeamPostWidgetState();
}

class _FindTeamPostWidgetState extends State<FindTeamPostWidget> {
  final GlobalKey _applyButtonKey = GlobalKey(); // Key for Apply Button
  final GlobalKey _avatarKey = GlobalKey(); // Key for CircleAvatar
  Offset? _applyButtonOffset;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateOffsets();
    });
    // Listen to theme changes
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = _updateTheme;
    _updateTheme();
  }

  void _updateTheme() {
    final Brightness brightness = WidgetsBinding.instance.window.platformBrightness;
    setState(() {
      isDarkMode = brightness == Brightness.dark;
    });
  }

  void _calculateOffsets() {
    final RenderBox applyButtonBox =
        _applyButtonKey.currentContext?.findRenderObject() as RenderBox;
    final RenderBox avatarBox =
        _avatarKey.currentContext?.findRenderObject() as RenderBox;

    setState(() {
      _applyButtonOffset = applyButtonBox.localToGlobal(Offset.zero) -
          avatarBox.localToGlobal(Offset.zero) +
          Offset(0, 10); // Adjust the y-position by 10px
    });
  }