// This script loads the Flutter web app and handles browser history correctly for SPA navigation
window.addEventListener('load', function(ev) {
  // Download main.dart.js
  _flutter = {};
  _flutter.loader = _flutter.loader || {};
  _flutter.loader.loadEntrypoint = function(options) {
    return new Promise((resolve, reject) => {
      try {
        const scriptTag = document.createElement('script');
        scriptTag.src = 'main.dart.js';
        scriptTag.type = 'application/javascript';
        scriptTag.onload = () => resolve(options);
        document.body.appendChild(scriptTag);
      } catch(error) {
        reject(error);
      }
    });
  };
  
  _flutter.loader.loadEntrypoint({
    serviceWorker: {
      serviceWorkerVersion: serviceWorkerVersion,
    },
    onEntrypointLoaded: function(engineInitializer) {
      engineInitializer.initializeEngine().then(function(appRunner) {
        appRunner.runApp();
      });
    }
  });
});

var serviceWorkerVersion = null;
