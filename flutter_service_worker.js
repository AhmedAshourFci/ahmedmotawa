'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "dbedbe7b30659547b4784b8bdb61d4e1",
"assets/AssetManifest.bin.json": "4db3bd4fc27ca1b2a0ede5aa9c939bef",
"assets/AssetManifest.json": "9d4e4c1e6e264e32802b613a2c5b9319",
"assets/assets/apps/alyusr_1.jpg": "42a264ad046f6fe436b81b0b1a7f1959",
"assets/assets/apps/baytak_yuhimna_1.jpg": "874e011e0f1c0472974e901ed6f469ee",
"assets/assets/apps/dupla_1.jpg": "71d493cd966e49f08755357d74e0c7a4",
"assets/assets/apps/marez_1.jpg": "76b1c1b8581f68213497465f8013add9",
"assets/assets/apps/tajweedly_1.jpg": "59c801efd793e2a03c31c1d4fc70cb0a",
"assets/assets/cv/Ahmed_Motawa_CV_AR.pdf": "f35ad7b61eaa3c863182c47017c08fd7",
"assets/assets/cv/Ahmed_Motawa_CV_EN.pdf": "7f51abb34252e60c8a0030e9386a72d0",
"assets/assets/images/app_icon.png": "e09d3cbff278ed98ff755f94073a62e9",
"assets/assets/images/native_splash.png": "81d649eef1653073c20ed055300fa147",
"assets/assets/images/profile.jpg": "ec0d9ad451890c65f81ae823100d6c22",
"assets/FontManifest.json": "2a3f09429db12146b660976774660777",
"assets/fonts/MaterialIcons-Regular.otf": "80746779935c52fda03422946db878fc",
"assets/NOTICES": "26855a3040819fe6008aac1ffd49e0dd",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "d40c67ce9f52d4bf087e61453006393c",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "8d0acfbf774979914d3c0d736f4be13e",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "f4fe3421cf9dbd06c748f1932883ff6f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "19910503cc3503214daae5cb30bb23f5",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "03ad43f123ba992fd07041500bb6ffa2",
"icons/Icon-192.png": "64cc5c390b4cd78bd0129718b3581d47",
"icons/Icon-512.png": "31e6869b8d348478dbd73b65eda640bd",
"icons/Icon-maskable-192.png": "64cc5c390b4cd78bd0129718b3581d47",
"icons/Icon-maskable-512.png": "31e6869b8d348478dbd73b65eda640bd",
"index.html": "d729375b9ed0bbeacefabd00ead1698b",
"/": "d729375b9ed0bbeacefabd00ead1698b",
"main.dart.js": "9752040f5cdfefa286a99405c39454b3",
"manifest.json": "71f3694b3945b7c04c830059a5597215",
"splash/img/dark-1x.png": "723c830fd22df56377209723ca846419",
"splash/img/dark-2x.png": "5a511b29d5a6b53c461df8da96dde304",
"splash/img/dark-3x.png": "35a4f2262014aeae225d9a8b22895131",
"splash/img/dark-4x.png": "f16ee2911710e16600de48702ff472d9",
"splash/img/light-1x.png": "723c830fd22df56377209723ca846419",
"splash/img/light-2x.png": "5a511b29d5a6b53c461df8da96dde304",
"splash/img/light-3x.png": "35a4f2262014aeae225d9a8b22895131",
"splash/img/light-4x.png": "f16ee2911710e16600de48702ff472d9",
"version.json": "be4c05a6bbb5623ea3f3fbfaba95b7d5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
