import 'package:flutter/material.dart';

class ScreenshotGallery extends StatefulWidget {
  final List<String> screenshots;
  final int initialIndex;

  const ScreenshotGallery({
    super.key,
    required this.screenshots,
    required this.initialIndex,
  });

  @override
  State<ScreenshotGallery> createState() => _ScreenshotGalleryState();
}

class _ScreenshotGalleryState extends State<ScreenshotGallery> {
  late int _currentIndex;
  late PageController _pageController;
  final TransformationController _transformationController = TransformationController();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    
    // Initialize with identity matrix to allow panning from the start
    _transformationController.value = Matrix4.identity();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  String _getImagePath(String path) {
    return path.startsWith('assets/') ? path : 'assets/$path';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true, // Allow body to extend behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '${_currentIndex + 1} / ${widget.screenshots.length}',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetZoom,
            tooltip: 'Réinitialiser le zoom',
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: _transformationController.value != Matrix4.identity() 
            ? const NeverScrollableScrollPhysics() // Disable page swiping when zoomed
            : const AlwaysScrollableScrollPhysics(),
        itemCount: widget.screenshots.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            _resetZoom();
          });
        },
        itemBuilder: (context, index) {
          return Center(
            child: GestureDetector(
              onDoubleTap: () {
                if (_transformationController.value == Matrix4.identity()) {
                  // Zoom in on double tap
                  _transformationController.value = Matrix4.diagonal3Values(2.0, 2.0, 1.0);
                } else {
                  // Reset zoom on double tap when already zoomed
                  _resetZoom();
                }
              },
              child: InteractiveViewer(
              transformationController: _transformationController,
              minScale: 0.5,
              maxScale: 4.0,
              clipBehavior: Clip.none, // Allow content to expand beyond bounds
              constrained: false, // Don't constrain to the original viewport
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 160, // Account for app bar and bottom bar
                child: Image.asset(
                  _getImagePath(widget.screenshots[index]),
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade800,
                      child: const Center(
                        child: Icon(Icons.broken_image, 
                                    size: 60, 
                                    color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
                        ));
        },
      ),
      bottomNavigationBar: widget.screenshots.length > 1
          ? BottomAppBar(
              color: Colors.black.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: _currentIndex > 0
                        ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: _currentIndex < widget.screenshots.length - 1
                        ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
