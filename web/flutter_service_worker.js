'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "3003b40593b77e3f3ffd48dc25c01a29",
"assets/assets/directors/%25E0%25B8%25A8%25E0%25B8%25B8%25E0%25B8%25A0%25E0%25B8%2581%25E0%25B8%25A3%2520%25E0%25B9%2580%25E0%25B8%25AB%25E0%25B8%25A3%25E0%25B8%25B5%25E0%25B8%25A2%25E0%25B8%258D%25E0%25B8%25AA%25E0%25B8%25B8%25E0%25B8%25A7%25E0%25B8%25A3%25E0%25B8%25A3%25E0%25B8%2593.jpg": "80def4eaf9852e5965499aa3e99f794e",
"assets/assets/directors/Adam%2520Mason.jpg": "d9b1f34cf82990a23ae4a5921f6c8a8f",
"assets/assets/directors/Adam%2520Randall.jpg": "80ddf1af7778e2861946839c28add985",
"assets/assets/directors/Chad%2520Stahelski.jpg": "3387d1100260d1719a16cd43fe718e38",
"assets/assets/directors/Chlo%25C3%25A9%2520Zhao.jpg": "6c15c665bde1bbbb11a38b89fe783957",
"assets/assets/directors/Destin%2520Daniel%2520Cretton.jpg": "d8a7ea7a7a82abd8d2003b360e6f2abe",
"assets/assets/directors/Mark%2520Waters.jpg": "2190499834d5cf390550e77ce42869a7",
"assets/assets/directors/Matthias%2520Schweigh%25C3%25B6fer.jpg": "4a4faf04eee553eea4bcffacf8a91cc6",
"assets/assets/directors/Matthijs%2520van%2520Heijningen%2520Jr..jpg": "e83707fa771e4ebe566c6a213ca9d339",
"assets/assets/movies/Army-of-Thieves.jpg": "9429d22c1bb944bf100e4b2a96e99e7e",
"assets/assets/movies/Eternals.jpg": "11e7fc118631bce5a25b40c012e6804f",
"assets/assets/movies/Eternals_2.jpg": "5c1cb028a0f4fe41447aa3548d0c38a6",
"assets/assets/movies/haunted-tales.jpg": "cc2b675f60220c29769ae31435403866",
"assets/assets/movies/Hes-All-That.jpg": "565b0b5bf06c11d9af0d7de980f7bd5c",
"assets/assets/movies/Johnwick3.jpg": "041b6a125c6a3587edd7e99293315857",
"assets/assets/movies/nightteeth.jpg": "44a37dfc6c1bf682753dff567b3fa8db",
"assets/assets/movies/Shang-chi.jpg": "d661c2cc7c4126222440139393048bc8",
"assets/assets/movies/SongBird.jpg": "16a7d8921ce4f6b6f3d386e9c11df534",
"assets/assets/movies/Theforgottenbattle.jpg": "6081bf05751b6e2698c9bd2c78d0b753",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "1e1232d008a39a1b965c7a238bd622a9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "6a7b47aadd285e2e292f3be771fde375",
"/": "6a7b47aadd285e2e292f3be771fde375",
"main.dart.js": "7f1bb674665b116a5a4174d43504fd3a",
"manifest.json": "8fcd55fe149feac8eb05d76f4bdf8e1b",
"version.json": "91b0c081d80f7011048f21a3db0dffb3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
