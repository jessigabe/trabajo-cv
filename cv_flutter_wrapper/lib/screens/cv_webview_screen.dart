import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CvWebViewScreen extends StatefulWidget {
  const CvWebViewScreen({
    super.key,
    required this.darkMode,
    required this.onThemeChanged,
  });

  final bool darkMode;
  final ValueChanged<bool> onThemeChanged;

  @override
  State<CvWebViewScreen> createState() => _CvWebViewScreenState();
}

class _CvWebViewScreenState extends State<CvWebViewScreen> {
  late final WebViewController _controller;
  double _progress = 0;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (value) {
            setState(() => _progress = value / 100);
          },
          onPageFinished: (_) => _applyThemeToWeb(),
        ),
      )
      ..loadFlutterAsset('assets/web/index.html');
  }

  Future<void> _applyThemeToWeb() {
    return _controller.runJavaScript(
      'window.setThemeFromFlutter(${widget.darkMode});',
    );
  }

  Future<void> _toggleTheme() async {
    final newValue = !widget.darkMode;
    widget.onThemeChanged(newValue);
    await _controller.runJavaScript(
      'window.setThemeFromFlutter($newValue);',
    );
  }

  Future<void> _goHome() async {
    await _controller.runJavaScript('window.scrollCvToTop();');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hoja de Vida'),
            Text(
              'Jessica Cuasquen',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (_progress < 1)
            LinearProgressIndicator(value: _progress),
          Expanded(
            child: WebViewWidget(controller: _controller),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              _goHome();
              break;
            case 1:
              _controller.reload();
              break;
            case 2:
              _toggleTheme();
              break;
          }
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          const NavigationDestination(
            icon: Icon(Icons.refresh),
            label: 'Recargar',
          ),
          NavigationDestination(
            icon: Icon(
              widget.darkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            label: widget.darkMode ? 'Claro' : 'Oscuro',
          ),
        ],
      ),
    );
  }
}
