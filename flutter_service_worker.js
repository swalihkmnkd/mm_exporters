'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "3bfd8ebc8729ca98555eead5b1b8224a",
".git/config": "ce482d7f4024ec3b15d430aa71622f4c",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "34b1f5e486b61590915ab1c37778f130",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "f656a299a3e7db2b67401bf74ff07a8a",
".git/logs/refs/heads/gh-pages": "f656a299a3e7db2b67401bf74ff07a8a",
".git/logs/refs/remotes/origin/gh-pages": "e0e5d6bc8bb57c05ed49a8982a2a1dba",
".git/objects/07/0fa0b3f4242fbbc4f0f3951a09cbd169ca7289": "5b921659270b24271098df180c0b1aab",
".git/objects/0a/6efa8af19377052b0c655e1de0bd32ba0dda37": "3e668982528a739592cbfefcf2aea03f",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/20/71b297f4c4286137d4d7e7829f93e482bdf791": "8fbb04bbc764886dd203b89453cb0c68",
".git/objects/27/65e9f3cc77220fe02cc40dd96495f8fe7e14ae": "2708846748771c3be24b9c96f1798b58",
".git/objects/28/810bb566df392d4d884438039566ff89774ba4": "a33d16617d583db83d2b71f360a04fa4",
".git/objects/30/07e692a7830e9cee6830070af2bfccd364e4ab": "1be9544154c3c7b5741d4acfbe1fcfd4",
".git/objects/3d/dc3ced2df1be9fc9d8363135899a9362e335fd": "aade5a1a85d654d91ea1eea505a44882",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4b/767bcf287d08d2a51baea2bc0558d9bea955da": "5de4c0f7ad46a5f5d8d915a532d289da",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/4d/a790a28a9e0cacba4200b6b2c25ccdd888ec0b": "1c280a526abe0b133611cd318aaf36e3",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/53/f46895e5008c77343a15566ef1b26162db7602": "a6b6c8d5401bde40a4929b65c6f8edc8",
".git/objects/58/cdca3869a37f0103995c21c8b77c0f65fd84e7": "2d13592f787d42f1a8defc53c32d2e00",
".git/objects/5b/7f6b7c20119f365823348f9651cdbc550b2ae7": "3a45aa8996da142a5717068ae0f0ae2c",
".git/objects/5c/e70e357db483a25dc4c2a8eec8499c2f20aca3": "a081b9444453332d782a71406be6d6e9",
".git/objects/5e/9b30aaf7c92758cbf6d6c72eb75bdd9594225e": "73e718087787566cabeeab473c069a07",
".git/objects/5f/b9eb6f171bcdb38c32841456466007392ebc0f": "725b9f361d49f41310f6b99ed0ab4e39",
".git/objects/69/78644a93bdc170a59127445c36a9de867a2d0d": "7bde1e14094c16771c47d66cc63b55c8",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/74/8450bea4e5585604dcfda6a62847d6b6ed3f0d": "0e091860fdbc04be3bffbdb7088c2d4b",
".git/objects/75/b988ba8bd18381fa12b4502f88f97455007d8e": "45f9f1d853cd0c2056608259b60cd91d",
".git/objects/77/f8978bc61e64f70c1faedc1a193f9d38d1f957": "59b2d15aabca2acbb609d4dee733a8f9",
".git/objects/7a/16493f4bea7d22a6d5ee61b1b0270dfaa9f2b0": "6f73a9e7f56f463d10fa538879dd284e",
".git/objects/7e/0ae160c2362d443b54ec4ca2e42887c68e7b5b": "763b1e8e4c16c3326152b52d40aed28d",
".git/objects/85/35ae52cd9708296f8baa0dc30498662fb3ce3b": "fe2a8047c7b05fe14a5be2cec310c93d",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/e3274ad3009bfabb18cce2dcef26117aa9c7cf": "1183e21c9c798513718f79bbd0f2532f",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/99/b6e71cb4edc1c43ea5076343dffe7770d5fc3a": "a6727fa7ec535eed3e9f9ac32ff055c7",
".git/objects/99/e63ebc74f843e24b0e8597f3df24b30cede67c": "83af596e46e49b22cffc0a0ef79cee75",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/9c/b3ca74237b11e557ab528da45f6494d7c3d982": "d31a491262a1dd4880bf6676892a592f",
".git/objects/a0/efc81e4021e0f25a36f5e62fbfb9ebb35bb3d6": "18834b558e5b21b2ad372852e44974f5",
".git/objects/a4/be9fd1e003ea94cc427400e90da49b0515c56b": "61182760d56ba8825717a2101555c33d",
".git/objects/a7/49a9aa749576128c766423af33325d14c908bf": "2c766373e36f6f904832eec2c8e5f8e5",
".git/objects/ab/4d671129f4abb274b6c0a9022cf9fcc0eef286": "98de583e661ae3de5ab362caad45e679",
".git/objects/ae/4a4c2fe631c7fa105e35951832014bffa2ae8d": "3af4a228a1374a1930cde3c2007d5530",
".git/objects/b3/b880aeddddd5fd33ae7a23ab9f1c8ba752257f": "63c4e6ad49a2de8ad3f29e5b4c9a9913",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/f3820ecf9e20484b77a5b732613ebbac55115e": "46df3d26973cf0cd8a77fe5761cb283b",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/be/e21cfd39897576739e43aa2809374270ca3df9": "1797f27bfeab44d28b3b9a06910be51a",
".git/objects/bf/dfdb33016eb02ff8745624d854f6d672c837c0": "f03deb1a3df7fefbe493743facbb684c",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/cc/7d73c02808081d04332e1434c2ef334ce48549": "36aba758d0492638b506fc12f2516b4c",
".git/objects/ce/27555e88a3fedff3e95469014a26bfc1b5732c": "add1e45c398585a0adf6d76b470dabb0",
".git/objects/d2/67dabeca2dd0c6a7442a2bb652dcf7d95622e0": "2e64bd805aea410b6cac9a5a109d4cab",
".git/objects/d2/e077ccdd50fff369bd52935bc85faf1f675ce7": "78b578d6dda7714bec08a137da8de6fa",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/3b341e84afec6be74559efa86b5be43453d965": "9d396465eaf4f99470278b0f798e2902",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/de/1da4edffc52cf25e89e09efde80413a3c484a5": "e66312dc9788d2e2862a8fa9006f7215",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f0/0927621f375bb9b13615913c8b67b72113c69b": "264b1d8199778bd2ce8153e1787ef808",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f9/817a6bdfd211cf048b97aa3484f3db102e77d7": "4cce3f0cbc405ce7c29cd69275321991",
".git/refs/heads/gh-pages": "3594e8d37ce3bd2064731e53974833a1",
".git/refs/remotes/origin/gh-pages": "3594e8d37ce3bd2064731e53974833a1",
"assets/AssetManifest.bin": "a6eac47ca3a5db7bfc37c3ce28e14990",
"assets/AssetManifest.bin.json": "6a4981427277e49b71fd393de1ee2cd0",
"assets/AssetManifest.json": "696d248b1286ea381b05ecb5653419d0",
"assets/assets/img.png": "371d3533413cae44a49e42ed50bb685d",
"assets/assets/img_1.png": "2d10c6e6eef7a4b6faf159cff19bc66b",
"assets/assets/img_10.png": "d5d6524ea01c45fd3984a74add20299c",
"assets/assets/img_11.png": "b0caecb58305af5d8b528370496f6f65",
"assets/assets/img_12.png": "9af86928f5165a8b494feb633dae7c34",
"assets/assets/img_13.png": "19b2d9a58083c271a6e0b21ca47df583",
"assets/assets/img_14.png": "5fb237598375606826dee04dca50543e",
"assets/assets/img_15.png": "dface60603e52a17f8a2149a8820c330",
"assets/assets/img_16.png": "0480435b035ce1d9470ebb9546ad907d",
"assets/assets/img_17.png": "14d268c8da65343d7cfbc290660f6872",
"assets/assets/img_18.png": "dbdb6861253c29342867c2494cb1865d",
"assets/assets/img_19.png": "4c99cbad31922e4e6a505f1d88b5d270",
"assets/assets/img_2.png": "ed7b87d4eb5303a13a05d9ac4d6307de",
"assets/assets/img_20.png": "602ce1e5d3d79e273e283375faa94f96",
"assets/assets/img_3.png": "36d8f3cb4c179bb693a100b09b13b68c",
"assets/assets/img_4.png": "6f476ee7a855739446971e5fd260dc3d",
"assets/assets/img_5.png": "604fa343a2d82e5ff194b30c00fa7328",
"assets/assets/img_6.png": "dd08ac1387e4083965e660a64de125a9",
"assets/assets/img_7.png": "bb8156a9b7f33fd475bedeb00f90b509",
"assets/assets/img_8.png": "a14d6a2f1e5dc4789c23797298f2dae7",
"assets/assets/img_9.png": "8825338872e208c63e97b260fc7681cd",
"assets/assets/shirt1.png": "ccbf118b837eaca27259afdf1a7ba723",
"assets/assets/shirt2.png": "b0d356c1f0b9bb02d04ad52fb167715c",
"assets/assets/translations/ar.json": "254447499ff45428fd77001b62781932",
"assets/assets/translations/en.json": "4242f7eb365e9b239361904c27921769",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "17600eb3a05a0cd738d5b56cfd8ed548",
"assets/NOTICES": "f988dc6fae6b21ed311b04d0879a20f2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "0e22ccb2c2809e25469ca7a4b6537569",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "62851aa36846fc9fb1d55989ab497d76",
"/": "62851aa36846fc9fb1d55989ab497d76",
"main.dart.js": "472abf6b697eb9ed6058596f26e60da6",
"manifest.json": "4a031a8cea7af5e6e88b936099ffe911",
"version.json": "2b406b8b522268dfbea2fdd433baf553"};
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
