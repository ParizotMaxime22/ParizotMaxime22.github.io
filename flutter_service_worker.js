'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "691e8bc0a110e6b644e51ba7d480c5f1",
".git/config": "f3d92cda2bb590d7e4e733a1af352ef2",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "2434f7b09a87f91586a39f178a94728d",
".git/HEAD": "aff6b917cd7b08a43b57938e66ccccd0",
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
".git/index": "eb2c4523c3d199d2ff67631b9085c4f6",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "48728b7d30462d0627893c9ab6f57d16",
".git/logs/refs/heads/deployment": "5d03fca2c74fb83780ecea4969cec865",
".git/logs/refs/heads/dev1": "0cd8813212267a4143e5a96dbfbdb5c3",
".git/logs/refs/remotes/origin/deployment": "21ff9e2f3e4c8706b307a683d00a761b",
".git/logs/refs/remotes/origin/dev1": "bbb8435e11cf73ca403ffe4f6dd8ae5c",
".git/logs/refs/remotes/origin/main": "ba2ad4942f02981b317f5f6461613ac6",
".git/objects/00/76a6b62f262ead5c7296eadf960dee67b1ec20": "7396ef0b8918795bfc40b5983a9caff4",
".git/objects/03/2fe904174b32b7135766696dd37e9a95c1b4fd": "80ba3eb567ab1b2327a13096a62dd17e",
".git/objects/06/b849a46d22acf61b3e008b454ed010e940e49a": "23aa03a3724e145f07db39b62737e30f",
".git/objects/0a/2305548baa5a069ade7a4fea57ae3d1d5ca51d": "304579acca57ea5e4016e154fe400a4b",
".git/objects/0b/e1ebf77434099a8740b39237a705b79be48a88": "fec52693a0eab0ea573bcdbee46f93d3",
".git/objects/0d/45cf9e32ccfe45511ff1fed2026a9fa14681cc": "4612d0e1e04b97900f3be992db40cf05",
".git/objects/19/f0d997fb79b749db00ee0cf3499d2fa596d4ea": "205d1edc6e1ca182e0146cea9143e3f2",
".git/objects/1b/b9ea7ca64ba23acd1ee19b041c0d0907d292cb": "db61df0d0bed1a5f6ee147fac37ed293",
".git/objects/1d/a0c7700b1dbbedf1a09ab793d82f05a5770360": "e19c885376be1fd949c7ecfb3f7f614b",
".git/objects/21/6717d4773f177a2d2742e0c3ae2de783c9e2b2": "e970e6e3181d5f657d916395ac25b1ca",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/23/d7baa874885f99e5805b10788a376b94ae0261": "5a390533b93fc4a39f1e68d8e5ab6154",
".git/objects/25/e97644b11fcf50c5906c9f476daaf56de44f85": "ff3637fca42995bf63c03bdd12fd1ef0",
".git/objects/26/90390b1f62cf444bd8809bb1a2242f019b3d76": "63ea42e4a1785a62cba6ba2da317f6c7",
".git/objects/2a/c0a73e283f8409a65205d19cdca94c3cd7b348": "f82e15466efbfb8db7fbd26db1c092d2",
".git/objects/33/31d9290f04df89cea3fb794306a371fcca1cd9": "e54527b2478950463abbc6b22442144e",
".git/objects/33/5daf6f8b49cfb84e30ba8a1811a09dba0e30ea": "aad32d750f619f34ac8f4aa797625d1f",
".git/objects/35/79bc47bef02bf5b7e939553ab5de22c1bf8553": "a210208d80435f623b7644fc12b4f2f9",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/35/eb1ddfbbc029bcab630581847471d7f238ec53": "b69277a8e391674b63a06b70141a9094",
".git/objects/38/6dfdbbdd5e0b5d6680a681478adfcafb296ab5": "e0698db63c4e4286d5625c04143000a8",
".git/objects/38/f72c3b661274731c0dca4263c6147292c3313e": "06ec909689545717240ec77454003efe",
".git/objects/3e/d0ddd7136a48520910e7e4bf665362facd60d4": "c8322669a78b5f07c75b1decdc05718d",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/40/4214a19a969982556e9633fc38f4e218b09479": "793d60734c4effa15d6edf0ebdfb09a1",
".git/objects/44/61b475b3eb1fea7063c7a4c21356f0f8ebe204": "a64e2459402a56ffaac610cb1910cebc",
".git/objects/47/4f0672924853b88b7e5847ceaa099425c8ffe3": "96af0ca24ba2e281a23db42698fbaa95",
".git/objects/48/970e81cf8ad0760063b54bd964a1a03f61b40e": "e1917ff1ce0442c0a5ff559583089c3d",
".git/objects/4b/e5953388c4baecdc709e02bdd44e9959293fa0": "2ee6dbb374ee44a9c25f8e16eef23133",
".git/objects/4f/02e9875cb698379e68a23ba5d25625e0e2e4bc": "254bc336602c9480c293f5f1c64bb4c7",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/59/62efb2dffef4c259bda261b128fcab4b659c34": "11e1a7683fedc73b6a0da57ee3c6a112",
".git/objects/5c/aa6cc5115a97ad249121c2911f923b364607f6": "ab93a9ff3c0a586ca179343bcc96a5b6",
".git/objects/5d/916c1a9f12aaa4526504d2588a1d583a86b7d0": "a62570108ff47fb2ab8a39b4d70971d0",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/61/f0909ec06b40b26b7bc8d37d2f9c5f9aa0266f": "8adf1b2f91dff0a273631122444e26e1",
".git/objects/62/33fb79a6f12cc72bf9439a121f48d03810c2bf": "1ff715e1f6b75b9641426c2844871a5b",
".git/objects/63/9900d13c6182e452e33a3bd638e70a0146c785": "488924a8ec51457535ebf377a60e23c8",
".git/objects/64/5116c20530a7bd227658a3c51e004a3f0aefab": "f10b5403684ce7848d8165b3d1d5bbbe",
".git/objects/67/5c9affdf8cb05910440b71d7e8c4a9237fec29": "07bef008e5db9392aba589051c64ef8d",
".git/objects/68/f8c5914283fc85ac151f98329be2751a6e3619": "297d96ad9d89d83bf5d38b7828db10d9",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6d/c346a4f99831c0ef53b8f94058c098326e657f": "1a17e60c49fcbeecb1e02ef6031d8383",
".git/objects/72/2dccb786ab9d3f9d5c9abe6f7c6087de0847df": "bc526a6cc9ff7c2b52ee2cbb37af6e3e",
".git/objects/74/29b1770cac2e6ddefdadfd6936370501529dea": "abc9ad912f22278c44d4989a696ecfe6",
".git/objects/78/784dfcf442678fb957c96df46ede8a20ccedb5": "3a278c07836fc87b87a84ffc143dbf48",
".git/objects/79/be1f2beb5c2ee6c2953023bd1d8374a70f9d28": "2e6d7283dec33d2e3c3e9bbb6d8db7b9",
".git/objects/7b/c07ec21cfe35e60fd050ad8560bcdf2334de92": "1874b0af122889195b395817d0bcfceb",
".git/objects/80/21953ed9f8cc6cd6d71c79462bad4cd2b5394c": "03284f6a8250b2d15b1dbddc32d69c82",
".git/objects/85/1eb720158baf9da549a592be73e2c9f6893e58": "99501bc36780e3b5b45e493a5d720ad8",
".git/objects/85/e7c1dfcb7fbb33f932c81024018cd8c10519da": "120e3904444059277744fb60b97d42da",
".git/objects/86/f7b1ad938c83ea1a38843b1c6c5c137a2d9124": "9ec084ce6e2946ea447d7361a124463c",
".git/objects/87/97f9808d095f6ce26741acfd02c47408961e47": "03b147a290f605ba4efde0704a652eba",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/9a090c81508d97fcf779f2fb0992f97acba031": "a45fd460ac441a3f8fbaf97170ce1fa6",
".git/objects/8c/c348517458135641c17abe903b47be5f6c0162": "23e30c9e733563abd5683ab39de9f6f2",
".git/objects/8d/081513f4c523079187a7c97ddebc1a47f9ae22": "25be4e5e60f5b514c452948cdd289cd0",
".git/objects/90/8d42fae3822ea3189c600d5a18748b1274462a": "5417e66ce5e98c6e48650bae5406876d",
".git/objects/90/a62cf4a427bd851e43265c3a70085bc8fc571b": "d399fa138989bd4fe93d44d6565d52ab",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/93/be7fd9b9dcdd8564dafd7040a0c8c8f68d4080": "b27ff257c793a735fc818ff37f392ff9",
".git/objects/93/d0e31af6032454152355a73d3414525c79a696": "e26c9cbe7b6b9f1b7435d4b362806183",
".git/objects/9d/17ea01c868ad50f6887a3ebec9b2e90fe28520": "468fbfa8bc8e182f7d7269a612d4f2b8",
".git/objects/9d/2529bd49987cbdaed71a6bc9a8405ce9842eb3": "e9918f5515521c496667af54e286b0b0",
".git/objects/9e/098d51d772289e1decdd0f6415b4a78e1c0e2e": "a4082b4d9c993ae969e295d1753a1b1b",
".git/objects/a1/5fcdcf2b67bfdae2327d374b9281b954312729": "361b0aa9b1d0c413ee8e74d4df274433",
".git/objects/a1/8ef8e1d86be600024df96906a526d59cdb1300": "668782011d5f0ba098b6746d8816140f",
".git/objects/a3/8c99f7a895665ec07cfdd7005e130aec74a085": "17064c85945d30feb1a2a26974585c0d",
".git/objects/a4/184d42a8bf81301afd7ce4a314277691fb02f3": "015ecabca5c1d659b4abcd857184c7a9",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/a9/32543f0f5ee956a6d3fa1a015db646c1e8b6be": "a630daf21466971d09b965cde250b6c2",
".git/objects/ac/f23dae1f67587c939f4e43e9a0e125dfa8da54": "b8d3848723fc5deed8748f7db121e842",
".git/objects/ae/8e5161d2fd67edf06cc92b8cde2ca969097614": "0812cdc694092aff4852d250b5fb571e",
".git/objects/b0/95c374d22a551111c5d3809161ffde2f24d5db": "4e648f4169ec260455df567abcc06375",
".git/objects/b2/fa56b650359910da67f7ecb858fe8a64cf4c79": "f30b7d82aba4448f01f73168fa3bc778",
".git/objects/b3/971d41b6833bc9d76355154d0062a2850d4aab": "933360c790b9ea524d3ae10540f25e61",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/be/2096f70701476bdb1e6210f96a041f596e3adf": "695831f8dad94f9848c3ba3ceab63cdd",
".git/objects/c1/e90092aa1f67a0f4ee6bb00c985ea1ca99121f": "08c665f5ec25164c0d256bae95d7e440",
".git/objects/c2/89fb9ce3f2e5dce131cde1269abf6418c4e2aa": "fd7b85076238a96ee1099677167e1e3b",
".git/objects/c2/f97a387f0b2af9f4025785aa52074333cf37fb": "f98dbe40248ff75c764c6e64139ebb36",
".git/objects/c3/4067c989de023229c42408b3955864b575ead6": "6b3edb56bd9e7b6c5513f476c158025e",
".git/objects/c9/f4857b86f70ccedd7597ebee92e660650e36e9": "46fdb15e60b1879b9016c43d2840295e",
".git/objects/ca/775edb3c3d1880a443e6d5d4ac9cf95c8dbaf0": "8cca0a3db75d4011e08fbd77f9229d2c",
".git/objects/cb/6b7a6137f8e01d986294349a6bc2fadc6d1849": "9df7d09456db8013ef6b3c4b23309f7a",
".git/objects/cb/8657bb14bf7e99c5edb0d3a3256ee27ef68d67": "005a4e13331a044d7dad2f8d2352cd4f",
".git/objects/cf/29dd45b55e1fba8c87f95367014966330d7578": "d9da21ba73ddc4a1fa66330724aa9ff1",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/f18e2f23c80f1cdb2fded9fa4b906b6fcce344": "b56566726fe367c274975187a1354163",
".git/objects/d5/820d397dbdbc9a98ab1127a31e63831fc15d24": "61065cc8ad5f944474f8dc1e3e984b12",
".git/objects/d6/3cc3baffd842db8da96be6da827e44130c7921": "45afe9a612424cb5b9bd8f1e40e9dde0",
".git/objects/d6/565cc4bfb7362f583bece4d8fed5300aae38e1": "42c0d20f48dd0969cc313ef7ba049660",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/db/9ae70383644c93fcf6ea46b04623e5f4001585": "d0e590374c861c4eb86b4afddf7462c8",
".git/objects/e2/e8c784828c07d986b4d0db25f17da4fffd1347": "0b69352118416a9f50e00c64e52ba542",
".git/objects/e3/e9233c5579e9e4a914ef7060f1e4030357ebb8": "af39e262dcca44dd4d17ab9c5bd08172",
".git/objects/e5/355b3a4adb0f71060434d583093d88d45a71d0": "b6b5c7c215200f1d0e8145b7eadac538",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/6dfabc497cb3c0f40f1394d7d2cfb939341ce2": "749cef9bd57ad33b02db400132e46cf1",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/ef/d580f32d7f21d66beddd07d66336d083908503": "05cf0938b09ae53d0cde2ff206bd7c4b",
".git/objects/f1/c6467d5c713171e863005ef5929e0c5ee6e9dd": "fee8503fc220921dd1fccca0f1c48f61",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/f4/350218095f8cb955fb077666ab1fbcffcd61e7": "4777bfa50ede542a0c2d758c4e5e3e2b",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f6/3797bd16c89ba58f24d614e9bb9a7fb09cad60": "c70a9e9366f08df742c07d9a1342a054",
".git/objects/fd/386e6408ee6fa36551a1c3892061deb608c303": "5abc7751a1274117f5ff1c22b33d3768",
".git/objects/fe/3914bcf3baf9d87a873a444cac8aaf9dcd54c1": "372add7dd6cdabc32b9333e8d66bff72",
".git/objects/pack/pack-2063a127313929912325a324ecb805bfd808cbe2.idx": "4fe71ce582730e6274f56a72ca4d82ac",
".git/objects/pack/pack-2063a127313929912325a324ecb805bfd808cbe2.pack": "f34f188cb3466e79938eae39efd6bb22",
".git/objects/pack/pack-2063a127313929912325a324ecb805bfd808cbe2.rev": "b05d77b41bcef4102ea56a759fd9ea6f",
".git/refs/heads/deployment": "adf43208bc9a1c09af3ff1c1b69f292d",
".git/refs/heads/dev1": "3d211369e5b5aa6400eda9fa0a4ad7f0",
".git/refs/remotes/origin/deployment": "adf43208bc9a1c09af3ff1c1b69f292d",
".git/refs/remotes/origin/dev1": "68b5ecd6dccb44bfbcc563159d8a90a7",
".git/refs/remotes/origin/main": "801a5e99e278744b155ff97aa6d8f501",
".idea/misc.xml": "d4f288593ec15175e0ab2246a477dada",
".idea/modules.xml": "1b3ff706e5cf74b41c775d8c9ae0d772",
".idea/vcs.xml": "74d3a64f52848d5e8db631b1685e58c8",
".idea/workspace.xml": "a17f4924d4e44a5a7aea1670a5b465b3",
"assets/AssetManifest.bin": "6a0dbdd65cd5b30cad6c01b226f287cc",
"assets/AssetManifest.bin.json": "ee9e6747a7b1306fd42666992bf5e128",
"assets/AssetManifest.json": "323e2486dfdf483d61d8f4a50cbf709a",
"assets/assets/cv.png": "c89f96e5a8c482807cf2823f402b8b47",
"assets/assets/profile_picture.png": "9ed2825537db964f2b43f0f4e7a02236",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "43a2f5dc76f85d16ecc5066da4ec9984",
"assets/NOTICES": "8c316713aa81e66628648d04658d6fc5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "773e0c912933bd8721bbaa94a24eea71",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "cf944dd502adc8b7035bf7bbfd631193",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "c877aa9778ee52e4b205f361f72195b2",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "eea11f735135d8ad0f4b28e45bbc9589",
"icons/icon-192.png": "bcc934886f6b675580d061a3b4607e89",
"icons/icon-512.png": "0b02e0180c6defb6afc7d3721b1d2424",
"icons/icon-maskable-192.png": "bcc934886f6b675580d061a3b4607e89",
"icons/Icon-maskable-512.png": "0b02e0180c6defb6afc7d3721b1d2424",
"index.html": "b3a089ab9fe29e08ea852386308c661d",
"/": "b3a089ab9fe29e08ea852386308c661d",
"main.dart.js": "aef500b6a9f3877ebe55260fa924492c",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006",
"web.iml": "c4296068482f17ef64282890be4a6e8d"};
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
