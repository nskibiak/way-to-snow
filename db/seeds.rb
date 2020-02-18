require 'time'
require 'open-uri'
require 'nokogiri'
require 'json'

data = ["Abashiri Lake View,Rusutsu Resort,ABLE Hakuba GORYU,Adatara Kogen,Aizu Kogen Daikura,Aizu Kogen Nango,Aizu Kogen Takahata,Aizu Kogen Takatsue,Akakura Kanko Resort,Akakura Onsen,Akasawa,Akita Hachimantai,Amihari Onsen,Ani,Anpeizan,Aomori Spring Ski Resort,APPI,Asahi Prime,Asahi Shizenkan,Asama 2000 Park,Asarigawa Onsen,Bibai Kokusetsu,Canmore Ski Village,Charmant Hiuchi,Chateau Shiozawa,Chateraise Ski Resort Yatsugatake,Chikusa Kogen,Chokai Kogen Yashima,Chuo-do Ina Ski Resort,Cupid Valley,Dynaland,Edelweiss Ski Resort,Engaru Rock Valley,Fairy Land Kaneyama,Family Gerende Kirigamine,Fujimi Panorama Resort,Fujiten Snow Resort,Fujiwara,Fujiyama Snow Resort Yeti,Furano,GALA Yuzawa,Geihoku Kokusai,Geto Kogen,Gokase Highland,Grandeco Snow Resort,Grandee Hatoriko Ski Resort,GRANSNOW Okuibuki,Greenpia Onuma,Gujo Vacance Mura,Hachi Kita Kogen,Hachi Kogen,Hachimantai Resort Panorama,Hachimantai Tayama,Haginoyama Shimin,Hagurosan,Hakkai Sanroku,Hakkoda,Hakodate Nanae Snow Park,Hakodateyama,Hakuba 47 Winter Sports Park,Hakuba Cortina,Hakuba Happo-one,Hakuba Iwatake Snow Field,Hakuba Norikura Onsen,Hakuba Sanosaka,Hakuba Valley Kashimayari,Hakusan Ichirino Onsen,Hakusan Seymour,Hanagasa Kogen,Hanawa,Hidafunayama Snow Resort Alcopia,Hidaka Kokusai,Hiraya Kogen,Hirayu Onsen,Hirugano Kogen,Hiruzen Bear Valley,Hiruzen Kids Snow Park,Hokkaido Greenland White Park,Hoshino Resort Alts Bandai,Hoshino Resort Tomamu,Hoshino Resort Urabandai Nekoma,Hounokidaira,Hunter Mountain Shiobara,Hyonosen Kokusai,Hyperbowl Tohachi,Iizuna Resort,Ikawa Skijo Kainayama,Ikenotaira Onsen,Imajo 365,Inawashiro,Inawashiro Resort,IOX-AROSA,Ishiuchi Hanaoka,Ishiuchi Maruyama,Ishizuchi,Iwakisan Hyakuzawa,Iwappara,Iwate Kogen Snow Park,Jeunesse Kurikoma,Jibuzaka Kogen,Jigatake,Joetsu Kokusai,Kagamiganaru,Kagura,Kaida Kogen Mia,Kamui Ski Links,Kamuro,Kandatsu Snow Resort,Karuizawa Prince Hotel,Karuizawa Snow Park,Kawaba,Kazawa Snow Area,Kiroro,Kita Shiga Komaruyama,Kita Shinshu Kijimadaira,Kitami Wakamatsu Shimin,Koeji,Koide,Kokusetsu Ashibetsu,Kokusetsu Horotachi,Komagane Kogen,Kotobiki Forest Park,Koumi Re-Ex Ski Valley,Kujyu Shinrin Koen,Kuma Ski Land,Kunimidaira,Kunizakai Kogen Snow Park,Kurobushi Kogen Snow Park Jangle Jungle,Kurohime Kogen Snow Park,Kurumayama Kogen SKYPARK,Kusatsu Onsen,Kutsuki Snow Park,Kyukamura Myoko RunRun,Listel Ski Fantasia,Madarao Mountain Resort,Maiko Snow Resort,Makado Onsen,Manba,Manza Onsen,Marunuma Kogen,Mashike Choei Syokanbetsudake,Matsudai Family,Matsunoyama Onsen,Megahira Onsen Megahira,Meiho,Memuro,Minakami Hodaigi,Minakami Kogen Ski Resort,Minami Furano,Minowa,Miyagi Zao Eboshi,Miyagi Zao Shiroishi,Miyagi Zao Sumikawa Snow Park,Mizuho Highland,Montdeus Hidakuraiyama Snow Park,Mount Racey,Moya Hills,Mt Granview,Mt Jeans Ski Resort Nasu,Mt Norikura Snow Resort,Muica Snow Resort,Muikamachi Hakkaisan,Mutsushi Kamafuseyama,Myoko Ski Park,Myoko Suginohara,Naeba,Nakasato Kiyotsu,Namari Onsen,Nayoro Piyashiri,New Greenpia Tsunan,Nihonmatsu Shiozawa,Nikko Yumoto Onsen,Ninox Snow Park,Niseko Annupuri Kokusai,Niseko Mountain Resort Grand Hirafu,Niseko Village Ski Resort,Nomugitoge,Norn Minakami,Northern Arc Resort,Nozawa Onsen,Nukabira Gensenkyo,Numajiri,Oguna Hotaka,Ojiro,Oku Kannabe,Okunakayama Kogen,Okutone Snow Park,Onikoube,Ontake 2240,Osorakan Snow Park,Otaru Tenguyama,Otoifuji,Owani Onsen,Palcall Tsumagoi Resort,Pilatus Tateshina Snow Resort,Pippu,Pirika,Riverwell Ikawa,Ryuoo Ski Park,Sahoro Resort,Sakae Club,Saku Ski Garden Parada,Santa Present Park Mallows Garande,Sapporo Bankei,Sapporo Kokusai,Sapporo Teine,Seki Onsen,Shibetsu Choei Kanayama,Shichinohe Choei,Shiga Kogen Giant,Shiga Kogen Higashitateyama,Shiga Kogen Hoppo Bunadaira,Shiga Kogen Ichinose Diamond,Shiga Kogen Ichinose Family,Shiga Kogen Kumanoyu,Shiga Kogen Nishitateyama,Shiga Kogen Okushiga Kogen,Shiga Kogen Sun Valley,Shiga Kogen Takamagahara Mammoth,Shiga Kogen Tannenomori Okojo,Shiga Kogen Terakoya,Shiga Kogen Yakebitaiyama,Shiga Kogen Yokoteyama,Shirakaba 2in1,Shirakaba Resort Ikenotaira Snow Park,Shirakabako Royal Hill,Shizukuishi,Ski Jam Katsuyama,Sky Valley,Snow Cruise Onze,Snow Park Oze Tokura,Snow Wave Park Shiratori Kogen,SOL-FA Oda,Spring Valley Izumi Kogen,St.MARY,Star Spur Ryokufu Resort Hida Nagareha,Sugadaira Kogen Snow Resort,Suhara,Suishozan,Sun Meadows Kiyosato,Sunlaiva,Taiheizan Opas,Taira,Takanbo,Takasu Snow Park,Takinouecho Sakuragaoka,Tambara Ski Park,Tangram Ski Circus,Tanigawadake Tenjindaira,Taranokidai,Tateshina Tokyu,Tazawako,Tendo Kogen,Tengamori,Tengendai Kogen,Togakushi,Togari Onsen,Tonami Yumenotaira,Towadako Onsen,Tsugaike Kogen,Unazuki Snow Park,Up Kannabe,Utopia Saioto,Wakasa Hyonosen,Washigatake,White Pia Takasu,White Valley,White World Oze Iwakura,Winghills Shirotori Resort,X-JAM Takaifuji,Yabuhara Kogen,Yachiho Kogen,Yakushi,YAMABOKU Wild Snow Park,Yamagata Akakura Onsen,Yawata Highland 191 Resort,Yogo Kogen Resort Yap,Yomase Onsen,Yudonosan,Yunomaru,Yuzawa Kogen,Yuzawa Nakazato Snow Resort,Yuzawa Park,Zao Liza World,Zao Onsen,,","Abashiri,Rusutsu,Hakuba,Nihonmatsu,Minami Aizu,Minami Aizu,Minami Aizu,Minami Aizu,Myoko,Myoko,Minakami,Kazuno,Shizukuishi,Kita Akita,Abira,Ajigasawa,Hachimantai,Asahi,Asahi,Komoro,Otaru,Bibai,Higashigawa,Itoigawa,Minamiuonuma,Kawakami,Shiso,Yurihonjo,Ina,Joetsu,Gujo,Nikko,Engaru,Kaneyama,Suwa,Fujimi,Narusawa,Minakami,Susono,Furano,Yuzawa,Kita Hiroshima,Kitakami,Gokase,Kita Shiobara,Tenei,Maibara,Mori,Gujo,Kami,Yabu,Hachimantai,Hachimantai,Iwamizawa,Tsuruoka,Minamiuonuma,Aomori,Nanae,Takashima,Hakuba,Otari,Hakuba,Hakuba,Otari,Hakuba,Omachi,Hakusan,Hakusan,Obanazawa,Kazuno,Takayama,Hidaka,Hiraya,Takayama,Gujo,Maniwa,Maniwa,Iwamizawa,Bandai,Shimukappu,Kita Shiobara,Takayama,Nasu Shiobara,Yabu,Yabu,Iizuna,Miyoshi,Myoko,Minami Echizen,Inawashiro,Inawashiro,Nanto,Minamiuonuma,Minamiuonuma,Saijo,Hirosaki,Yuzawa,Shizukuishi,Higashinaruse,Achi,Omachi,Minamiuonuma,Kofu,Yuzawa,Kiso,Asahikawa,Kaneyama,Yuzawa,Karuizawa,Naganohara,Kawaba,Tsumagoi,Akaigawa,Yamanouchi,Kijimadaira,Kitami,Oshu,Uonuma,Ashibetsu,Horokanai,Komagane,Iinan,Koumi,Kokonoe,Kuma Kogen,Oshu,Takashima,Higashine,Shinano,Chino,Kusatsu,Takashima,Myoko,Inawashiro,Iiyama,Minamiuonuma,Noheji,Toyooka,Tsumagoi,Katashina,Mashike,Tokamachi,Tokamachi,Hatsukaichi,Gujo,Memuro,Minakami,Minakami,Minamifurano,Inawashiro,Zao,Shiroishi,Zao,Ohnan,Takayama,Yubari,Aomori,Minamiuonuma,Nasu,Matsumoto,Minamiuonuma,Minamiuonuma,Mutsu,Myoko,Myoko,Yuzawa,Tokamachi,Hanamaki,Nayoro,Tsunan,Nihonmatsu,Nikko,Shibata,Niseko,Kutchan,Niseko,Matsumoto,Minakami,Kitami,Nozawa Onsen,Kamishihoro,Inawashiro,Katashina,Kami,Toyooka,Ichinohe,Minakami,Osaki,Otaki,Akiota,Otaru,Otoineppu,Owani,Tsumagoi,Chino,Pippu,Imakane,Shizuoka,Yamanouchi,Shintoku,Sakae,Saku,Asahikawa,Sapporo,Sapporo,Sapporo,Myoko,Shibetsu-cho,Shichinohe,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Yamanouchi,Tateshina,Chino,Chino,Shizukuishi,Katsuyama,Kami,Otaru,Katashina,Gujo,Uchiko,Sendai,Kawasaki,Hida,Ueda,Uonuma,Kazuno,Hokuto,Noboribetsu,Akita,Nanto,Nanto,Gujo,Takinoue,Numata,Shinano,Minakami,Tsuruoka,Chino,Semboku,Tendo,Yokote,Yonezawa,Nagano,Iiyama,Tonami,Towada,Otari,Kurobe,Toyooka,Kita Hiroshima,Wakasa,Gujo,Gujo,Minakami,Katashina,Gujo,Yamanouchi,Kiso,Sakuho,Uonuma,Takayama,Mogami,Kita Hiroshima,Nagahama,Yamanouchi,Tsuruoka,Tomi,Yuzawa,Yuzawa,Yuzawa,Kaminoyama,Yamagata,,","Hokkaido,Hokkaido,Nagano,Fukushima,Fukushima,Fukushima,Fukushima,Fukushima,Niigata,Niigata,Gunma,Akita,Iwate,Akita,Hokkaido,Aomori,Iwate,Nagano,Yamagata,Nagano,Hokkaido,Hokkaido,Hokkaido,Niigata,Niigata,Nagano,Hyogo,Akita,Nagano,Niigata,Gifu,Tochigi,Hokkaido,Fukushima,Nagano,Nagano,Yamanashi,Gunma,Shizuoka,Hokkaido,Niigata,Hiroshima,Iwate,Miyazaki,Fukushima,Fukushima,Shiga,Hokkaido,Gifu,Hyogo,Hyogo,Iwate,Iwate,Hokkaido,Yamagata,Niigata,Aomori,Hokkaido,Shiga,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Ishikawa,Ishikawa,Yamagata,Akita,Gifu,Hokkaido,Nagano,Gifu,Gifu,Okayama,Okayama,Hokkaido,Fukushima,Hokkaido,Fukushima,Gifu,Tochigi,Hyogo,Hyogo,Nagano,Tokushima,Niigata,Fukui,Fukushima,Fukushima,Toyama,Niigata,Niigata,Ehime,Aomori,Niigata,Iwate,Akita,Nagano,Nagano,Niigata,Tottori,Niigata,Nagano,Hokkaido,Yamagata,Niigata,Nagano,Gunma,Gunma,Gunma,Hokkaido,Nagano,Nagano,Hokkaido,Iwate,Niigata,Hokkaido,Hokkaido,Nagano,Shimane,Nagano,Oita,Ehime,Iwate,Shiga,Yamagata,Nagano,Nagano,Gunma,Shiga,Niigata,Fukushima,Nagano,Niigata,Aomori,Hyogo,Gunma,Gunma,Hokkaido,Niigata,Niigata,Hiroshima,Gifu,Hokkaido,Gunma,Gunma,Hokkaido,Fukushima,Miyagi,Miyagi,Miyagi,Shimane,Gifu,Hokkaido,Aomori,Niigata,Tochigi,Nagano,Niigata,Niigata,Aomori,Niigata,Niigata,Niigata,Niigata,Iwate,Hokkaido,Niigata,Fukushima,Tochigi,Niigata,Hokkaido,Hokkaido,Hokkaido,Nagano,Gunma,Hokkaido,Nagano,Hokkaido,Fukushima,Gunma,Hyogo,Hyogo,Iwate,Gunma,Miyagi,Nagano,Hiroshima,Hokkaido,Hokkaido,Aomori,Gunma,Nagano,Hokkaido,Hokkaido,Shizuoka,Nagano,Hokkaido,Nagano,Nagano,Hokkaido,Hokkaido,Hokkaido,Hokkaido,Niigata,Hokkaido,Aomori,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Nagano,Iwate,Fukui,Hyogo,Hokkaido,Gunma,Gifu,Ehime,Miyagi,Miyagi,Gifu,Nagano,Niigata,Akita,Yamanashi,Hokkaido,Akita,Toyama,Toyama,Gifu,Hokkaido,Gunma,Nagano,Gunma,Yamagata,Nagano,Akita,Yamagata,Akita,Yamagata,Nagano,Nagano,Toyama,Aomori,Nagano,Toyama,Hyogo,Hiroshima,Tottori,Gifu,Gifu,Gunma,Gunma,Gifu,Nagano,Nagano,Nagano,Niigata,Nagano,Yamagata,Hiroshima,Shiga,Nagano,Yamagata,Nagano,Niigata,Niigata,Niigata,Yamagata,Yamagata,,","43.9882732,42.7529251,36.6630825,37.622532,37.1813894,37.1099183,37.1007815,37.1099183,36.8868768,36.890901,36.733021,40.0670801,39.821275,39.9548729,42.8639955,40.693185,40.0022571,36.1157389,38.3050131,36.4078826,43.165153,43.3219591,43.7303935,36.9993875,37.040049,35.9307913,35.2186928,39.1908349,35.81545,37.0549537,35.9903753,36.9250946,44.0219349,37.4447465,36.0831555,35.9105351,35.4420511,36.8966897,35.300021,43.3420458,36.950732,34.709421,39.236631,32.5790313,37.6955102,37.217492,35.5216216,42.0009957,35.9764265,35.4076414,35.3850321,39.8943758,40.1438424,43.1654762,38.7023743,37.1545927,40.6647741,41.9865313,35.4276315,36.685,36.7763409,36.7022164,36.715276,36.7658832,36.629392,36.5969431,36.2684053,36.3470779,38.5367155,40.2075515,36.0392401,42.8705009,35.3232905,36.1845001,36.0060101,35.2612212,35.3226018,43.1692672,37.5857807,43.0633092,37.651018,36.1758065,36.9381364,35.369888,35.3858828,36.737546,33.9510606,36.8725467,35.7232687,37.4968398,37.5780572,36.5151234,36.9907057,36.9778394,33.7682517,40.6559319,36.938189,39.813893,39.1589601,35.3713089,36.558551,37.0322462,35.3442525,36.8598524,35.9302824,43.704967,38.9165469,36.9110915,36.3367078,36.423111,36.769623,36.4713596,43.0756111,36.794799,36.8198644,43.7552033,39.154688,37.2335129,43.527765,44.0153113,35.7389891,35.054868,36.05431,33.1082158,33.718494,39.0595741,35.5357879,38.4359763,36.8264004,36.1020748,36.6228353,35.3290461,36.9117698,37.543172,36.852525,36.9823535,40.87519,35.460472,36.6406003,36.8149244,43.8096233,37.1270111,37.064836,34.498465,35.941763,42.9119137,36.8257736,36.8554132,43.1642201,37.6524464,38.1266811,38.0980663,38.1349194,34.8155267,36.0615516,43.0507014,40.7366202,36.9999711,37.127938,36.7489715,37.0714127,37.1079454,41.2597824,36.9104206,36.8569225,36.7880025,37.022328,39.4651445,44.4044208,36.961895,37.6402568,36.8061966,37.9268164,42.8474716,42.8616735,42.8469779,36.0484101,36.7433184,43.8697874,36.9206775,43.3638903,37.5986639,36.7807776,35.4559626,35.5033333,40.0833678,36.799041,38.788517,35.8629484,34.595713,43.1682627,44.7365372,40.5076896,36.556005,36.068014,43.8541427,42.513538,35.2199391,36.7873081,43.1664964,36.9961054,36.2944078,43.7609373,43.0177632,43.0722253,43.1285854,36.905978,43.6512742,40.6980312,36.7195034,36.7297857,36.7210708,36.7398976,36.7365845,36.7195034,36.7254206,36.778844,36.7160432,36.7311702,36.7195034,36.7260011,36.7525591,36.6688225,36.0950461,36.1092054,36.101986,39.6896382,36.0733333,35.398007,43.1459658,36.8511036,35.957247,33.5429017,38.418773,38.218677,36.310719,36.5324347,37.3335053,40.1689377,35.9475542,42.5216413,39.787416,36.4323951,36.3756237,35.9981595,44.1928345,36.7784595,36.8537567,36.8179474,38.6282136,36.0684099,39.7168527,38.3476642,39.3667681,37.7753276,36.7424835,36.932217,36.586196,40.579056,36.7489715,36.812244,35.500844,34.7858633,35.353907,35.942471,35.9558169,36.7948003,36.814998,35.965902,36.799554,35.9654446,36.0698583,37.2348697,36.6676338,38.7111674,34.6945296,35.6982962,36.780374,38.7024709,36.4138587,36.939573,36.9097508,36.9263889,38.1239993,38.1705275,,","144.2239807,140.902423,137.8365636,140.324427,139.6372355,139.6163485,139.4493178,139.6163485,138.1775916,138.176707,138.830078,140.7827828,140.93627,140.4908894,141.7980651,140.2793,140.9705409,137.834586,140.058493,138.4646114,141.0495947,141.9503621,142.5388561,138.0692194,138.8503141,138.4948563,134.3877563,140.0921195,137.916665,138.4847739,136.8702425,139.7489852,143.4958419,139.5351143,138.1647635,138.2070268,138.6879342,139.0817124,138.768364,142.3831624,138.79954,132.2376026,140.906277,131.1177451,140.1327019,140.0279215,136.3867294,140.6015243,136.9394447,134.5539185,134.5352755,140.9753814,140.9554132,141.8101522,139.9827131,138.9740149,140.912122,140.7467111,135.9959043,137.8283333,137.8886568,137.833887,137.85706,137.8739806,137.841677,137.8254561,136.7165704,136.6777617,140.5087916,140.8429539,137.2612545,142.4465299,137.6302506,137.557011,136.9078445,133.5963226,133.6809349,141.782259,140.0336165,142.6313059,140.0624219,137.4910015,139.7539208,134.539221,134.5665393,138.170689,133.8922281,138.171897,136.1483891,140.0620321,140.0604577,136.8221672,138.7992058,138.7976818,133.1142954,140.3029642,138.84056,140.9662195,140.7262223,137.6602824,137.803716,138.8213625,133.5913739,138.7265013,137.5300732,142.187102,140.3939686,138.8128117,138.6331117,138.627022,139.109315,138.4296237,140.9823481,138.448638,138.4033186,143.9211614,141.359271,138.953577,142.194757,142.1356223,137.8897044,132.768207,138.4116251,131.2913574,132.874481,140.9701424,136.0924978,140.5435039,138.1619578,138.208437,138.5967109,135.9397655,138.1686326,140.149645,138.289569,138.8245005,141.07075,134.6889442,138.5087179,139.330278,141.5289522,138.6056347,138.598905,132.14386,137.042953,143.0508638,139.0765422,139.0759736,142.5684074,140.2530725,140.5287472,140.6587766,140.4948378,132.4006181,137.2262541,141.9698251,140.7940869,138.8052187,140.015301,137.8661573,138.8460142,138.9777766,141.1178246,138.171841,138.15507,138.7671455,138.7276851,140.9926848,142.51344,138.68834,140.3341872,139.4248929,139.4679026,140.6479506,140.6981106,140.6843228,137.7092373,138.9421857,143.9248614,138.4523232,143.1870349,140.1287568,139.1679722,134.5365005,134.6822222,141.1904626,139.009219,140.6357422,137.5285798,132.146635,140.9700209,142.293883,140.5646047,138.464239,138.301437,142.4673624,140.1913583,138.2095048,138.4480924,142.8133357,138.5650926,138.5103322,142.3025948,141.2623908,141.0827825,141.2566269,138.16083,145.0991336,141.0989465,138.4896635,138.5209038,138.5063452,138.5108399,138.5135154,138.4896635,138.4990625,138.52925,138.4849365,138.5082369,138.4896635,138.5306105,138.5170957,138.5260801,138.2634545,138.2446712,138.234357,140.9913648,136.5555556,134.57332,141.1322695,139.2388303,136.805089,132.833574,140.723035,140.52119,137.2400625,138.3300744,139.0179068,140.7534356,138.4144551,141.1047369,140.219706,136.9527949,136.8625699,136.8771639,143.0949339,139.0727102,138.2627378,138.9482331,139.9330189,138.2512233,140.6544861,140.4825184,140.5978681,140.1339095,138.0850293,138.3876428,137.022204,140.993255,137.8661573,137.5845501,134.678251,132.3173434,134.5139154,136.919556,136.9348753,138.9573338,139.220037,136.80262,138.4250403,137.7395356,138.3808182,138.9913523,138.4606908,140.5525776,132.159825,136.1579078,138.4162532,139.9829184,138.4137924,138.8031455,138.8489519,138.8547222,140.4053757,140.4017353,,","hokkaido/abashiri/abashiri-lake-view,hokkaido/rusutsu/rusutsu-resort,nagano/hakuba/hakuba-goryu,fukushima/nihonmatsu/adatara-kogen,fukushima/minami-aizu/aizu-kogen-daikura,fukushima/minami-aizu/aizu-kogen-nango,fukushima/minami-aizu/aizu-kogen-takahata,fukushima/minami-aizu/aizu-kogen-takatsue,niigata/myoko/akakura-kanko-resort,niigata/myoko/akakura-onsen,gunma/minakami/akasawa,akita/kazuno/akita-hachimantai,iwate/shizukuishi/amihari-onsen,akita/kita-akita/ani,hokkaido/abira/anpeizan,aomori/ajigasawa/aomori-spring-ski-resort,iwate/hachimantai/appi-kogen,/nagano/asahi-nagano/asahi-prime,yamagata/asahi/asahi-shizenkan,nagano/komoro/asama-2000-park,hokkaido/otaru/asarigawa-onsen,hokkaido/bibai/bibai-kokusetsu,hokkaido/higashigawa/canmore-ski-village,niigata/itoigawa/charmant-hiuchi,niigata/minamiuonuma/chateau-shiozawa,nagano/kawakami/chateraise-resort-yatsugatake,hyogo/shiso/chikusa-kogen-nature-land,akita/yurihonjo/chokai-kogen-yashima,nagano/ina/chuo-do-ina-ski-resort,niigata/joetsu/cupid-valley,gifu/gujo/dynaland,tochigi/nikko/edelweiss-ski-resort,hokkaido/engaru/engaru-rock-valley,fukushima/kaneyama-fukushima/fairy-land-kaneyama,nagano/suwa/family-gerende-kirigamine,nagano/fujimi/fujimi-panorama-resort,yamanashi/narusawa/fujiten-snow-resort,gunma/minakami/minakami-kogen-fujiwara,shizuoka/susono/snow-town-yeti,hokkaido/furano/furano,niigata/yuzawa/gala-yuzawa,hiroshima/kita-hiroshima/geihoku-kokusai,iwate/kitakami/geto-kogen,miyazaki/gokase/gokase-highland,fukushima/kita-shiobara/grandeco-snow-resort,fukushima/tenei/grandee-hatoriko-ski-resort,shiga/maibara/oku-ibuki,hokkaido/mori/greenpia-onuma,gifu/gujo/gujo-kogen,hyogo/kami-hyogo/hachi-kita-kogen,hyogo/yabu/hachi-kogen,iwate/hachimantai/hachimantai-resort-panorama,iwate/hachimantai/hachimantai-tayama,hokkaido/iwamizawa/haginoyama-shimin,yamagata/tsuruoka/hagurosan,niigata/minamiuonuma/hakkai-sanroku,aomori/aomori/hakkoda,hokkaido/nanae/hakodate-nanae-snow-park,shiga/takashima/hakodateyama,nagano/hakuba/hakuba-47-winter-sports-park,nagano/otari/hakuba-cortina,nagano/hakuba/hakuba-happo-one,nagano/hakuba/hakuba-iwatake-snow-field,nagano/otari/hakuba-norikura-onsen,nagano/hakuba/hakuba-sanosaka,nagano/omachi/kashimayari-sports-village,ishikawa/hakusan/hakusan-ichirino-onsen,ishikawa/hakusan/hakusan-seymour,yamagata/obanazawa/hanagasa-kogen,akita/kazuno/hanawa,gifu/takayama-gifu/hidafunayama-snow-resort-alcopia,hokkaido/hidaka/hidaka-kokusai,nagano/hiraya/hiraya-kogen,gifu/takayama-gifu/hirayu-onsen,gifu/gujo/hirugano-kogen,okayama/maniwa/hiruzen-bear-valley,okayama/maniwa/hiruzen-kids-snow-park,hokkaido/iwamizawa/hokkaido-greenland-white-park,fukushima/bandai/hoshino-resort-alts-bandai,hokkaido/shimukappu/hoshino-resort-tomamu,fukushima/kita-shiobara/urabandai-nekoma,gifu/takayama-gifu/hounokidaira,tochigi/nasu-shiobara/hunter-mountain-shiobara,hyogo/yabu/hyonosen-kokusai,hyogo/yabu/hyperbowl-tohachi,nagano/iizuna/iizuna-resort,tokushima/miyoshi/ikawa-skijo-kainayama,niigata/myoko/ikenotaira-onsen,fukui/minami-echizen/imajo-365,fukushima/inawashiro/inawashiro,fukushima/inawashiro/inawashiro-resort,toyama/nanto/iox-arosa,niigata/minamiuonuma/ishiuchi-hanaoka,niigata/minamiuonuma/ishiuchi-maruyama,ehime/saijo/ishizuchi,aomori/hirosaki/iwakisan-hyakuzawa,niigata/yuzawa/iwappara,iwate/shizukuishi/iwate-kogen-snow-park,akita/higashinaruse/jeunesse-kurikoma,nagano/achi/jibuzaka-kogen,nagano/omachi/jigatake,niigata/minamiuonuma/joetsu-kokusai,tottori/kofu/kagamiganaru,niigata/yuzawa/kagura,nagano/kiso/kaida-kogen-mia,hokkaido/asahikawa/kamui-ski-links,yamagata/kaneyama-yamagata/kamuro,niigata/yuzawa/kandatsu-kogen,nagano/karuizawa/karuizawa-prince-hotel,gunma/naganohara/karuizawa-snow-park,gunma/kawaba/kawaba,gunma/tsumagoi/kazawa-snow-area,hokkaido/akaigawa/kiroro-snow-world,nagano/yamanouchi/kita-shiga-komaruyama,nagano/kijimadaira/kita-shinshu-kijimadaira,hokkaido/kitami/kitami-wakamatsu-shimin,iwate/oshu/koeji,niigata/uonuma/koide,hokkaido/ashibetsu/kokusetsu-ashibetsu,hokkaido/horokanai/kokusetsu-horotachi,nagano/komagane/komagane-kogen,shimane/iinan/kotobiki-forest-park,nagano/koumi/koumi-riekkusu-ski-valley,oita/kokonoe/kujyu,ehime/kuma-kogen/kuma-ski-land,iwate/oshu/kunimidaira,shiga/takashima/kunizakai-kogen-snow-park,yamagata/higashine/kurobushi-kogen-snow-park-jangle-jungle,nagano/shinano/kurohime-kogen-snow-park,nagano/chino/kurumayama-kogen,gunma/kusatsu/kusatsu-onsen,shiga/takashima/kutsuki-snow-park,niigata/myoko/kyukamura-myoko-run-run,fukushima/inawashiro/listel-ski-fantasia,nagano/iiyama/madarao-kogen,niigata/minamiuonuma/maiko-snow-resort,aomori/noheji/makado-onsen,hyogo/toyooka/manba,gunma/tsumagoi/manza-onsen,gunma/katashina/marunuma-kogen,hokkaido/mashike/mashike-choei-syokanbetsudake,niigata/tokamachi/matsudai-family,niigata/tokamachi/matsunoyama-onsen,hiroshima/hatsukaichi/megahira-onsen-megahira,gifu/gujo/meihou,hokkaido/memuro/memuro,gunma/minakami/minakami-houdaigi,gunma/minakami/minakami-kogen-ski-resort,hokkaido/minami-furano/minami-furano,fukushima/inawashiro/minowa,miyagi/zao/miyagi-zao-eboshi,miyagi/shiroishi/miyagi-zao-shiroishi,miyagi/zao/miyagi-zao-sumikawa-snow-park,shimane/ohnan/mizuho-highland,gifu/takayama-gifu/mondeus-hidakuraiyama-snow-park,hokkaido/yubari/mount-racey,aomori/aomori/moya-hills,niigata/minamiuonuma/mt-granview,tochigi/nasu/mt-jeans-ski-resort-nasu,nagano/matsumoto/mt-norikura,niigata/minamiuonuma/muikamachi-ski-resort,niigata/minamiuonuma/muikamachi-hakkaisan,aomori/mutsu/mutsushi-kamafuseyama,niigata/myoko/myoko-ski-park,niigata/myoko/myoko-suginohara,niigata/yuzawa/naeba,niigata/tokamachi/nakasato-kiyotsu,iwate/hanamaki/namari-onsen,hokkaido/nayoro/nayoro-piyashiri,niigata/tsunan/new-greenpia-tsunan,fukushima/nihonmatsu/nihonmatsu-shiozawa,tochigi/nikko/nikko-yumoto-onsen,niigata/shibata/ninohji-snow-park-ninox,hokkaido/niseko/niseko-annupuri-kokusai,hokkaido/kutchan/niseko-mountain-resort-grand-hirafu,hokkaido/niseko/niseko-village-ski-resort,nagano/matsumoto/nomugitoge,gunma/minakami/norn-minakami,hokkaido/kitami/northern-arc-resort,nagano/nozawa-onsen/nozawa-onsen,hokkaido/kamishihoro/nukabira-gensenkyo,fukushima/inawashiro/numajiri,gunma/katashina/snowpal-oguna-hotaka,hyogo/kami-hyogo/ojiro,hyogo/toyooka/oku-kannabe,iwate/ichinohe/okunakayama-kogen,gunma/minakami/okutone-snow-park,miyagi/osaki/onikoube,nagano/otaki/ontake-2240,hiroshima/akiota/osorakan-snow-park,hokkaido/otaru/otaru-tenguyama,hokkaido/otoineppu/otoifuji,aomori/owani/owani-onsen,gunma/tsumagoi/pallcall-tsumagoi-ski-resort,nagano/chino/pilatus-tateshina-snow-resort,hokkaido/pippu/pippu,hokkaido/imakane/imakane-cho-pilika,shizuoka/shizuoka/riverwell-ikawa,nagano/yamanouchi/ryuoo-ski-park,hokkaido/shintoku/sahoro-resort,nagano/sakae/sakae-club,nagano/saku/saku-ski-garden-parada,hokkaido/asahikawa/santa-present-park,hokkaido/sapporo/sapporo-bankei,hokkaido/sapporo/sapporo-kokusai,hokkaido/sapporo/sapporo-teine,niigata/myoko/seki-onsen,hokkaido/shibetsu-cho/shibetsu-choei-kanayama,aomori/shichinohe/shichinohe-choei,nagano/yamanouchi/shiga-kogen-giant,nagano/yamanouchi/shiga-kogen-higashitateyama,nagano/yamanouchi/shiga-kogen-bunadaira,nagano/yamanouchi/shiga-kogen-ichinose-diamond,nagano/yamanouchi/shiga-kogen-ichinose-family,nagano/yamanouchi/shiga-kogen-kumanoyu,nagano/yamanouchi/shiga-kogen-nishitateyama,nagano/yamanouchi/shiga-kogen-okushiga-kogen,nagano/yamanouchi/shiga-kogen-sun-valley,nagano/yamanouchi/shiga-kogen-takamagahara-mammoth,nagano/yamanouchi/shiga-kogen-tannenomori-okojo,nagano/yamanouchi/shiga-kogen-terakoya,nagano/yamanouchi/shiga-kogen-yakebitaiyama,nagano/yamanouchi/shiga-kogen-yokoteyama,nagano/tateshina/shirakaba-2-in-1,nagano/chino/shirakaba-resort,nagano/chino/shirakabako-royal-hill,iwate/shizukuishi/shizukuishi,fukui/katsuyama/ski-jam-katsuyama,hyogo/kami-hyogo/sky-valley,hokkaido/otaru/snow-cruise-onze,gunma/katashina/snow-park-oze-tokura,gifu/gujo/snow-wave-park-shiratori-kogen,ehime/uchiko/sol-fa-oda,miyagi/sendai/spring-valley-izumi-kogen,miyagi/kawasaki/st-mary,gifu/hida/star-spur-ryokufu-resort-hida-nagareha,nagano/ueda/sugadaira-kogen,niigata/uonuma/suhara,akita/kazuno/suishozan,yamanashi/hokuto/sun-meadows-kiyosato,hokkaido/noboribetsu/sunlaiva,akita/akita/taiheizan-opus,toyama/nanto/taira,toyama/nanto/takanbo,gifu/gujo/takasu-snow-park,hokkaido/takinoue/takinouecho-sakuragaoka,gunma/numata-gunma/tanbara-ski-park,nagano/shinano/tangram-ski-circus,gunma/minakami/tanigawadake-tenjindaira,yamagata/tsuruoka/taranokidai,nagano/chino/tateshina-tokyu,akita/semboku/tazawako,yamagata/tendo/tendo-kogen,akita/yokote/tengamori,yamagata/yonezawa/tengendai-kogen,nagano/nagano/togakushi,nagano/iiyama/togari-onsen,toyama/tonami/tonami-yumenotaira,aomori/towada/towadako-onsen,nagano/otari/tsugaike-kogen,toyama/kurobe/unazuki-onsen,hyogo/toyooka/up-kannabe,hiroshima/kita-hiroshima/utopia-saioto,tottori/wakasa/wakasa-hyonosen,gifu/gujo/washigatake,gifu/gujo/white-pia-takasu,gunma/minakami/tanigawa-onsen-white-valley,gunma/katashina/white-world-oze-iwakura,gifu/gujo/winghills-shirotori-resort,nagano/yamanouchi/x-jam-takaifuji,nagano/kiso/yabuhara-kogen,nagano/sakuho/yachiho-kogen,niigata/uonuma/yakushi,nagano/takayama-nagano/yamaboku-wild-snow-park,yamagata/mogami/yamagata-akakura-onsen,hiroshima/kita-hiroshima/yawata-highland-191-resort,shiga/nagahama/yogo-kogen-resort-yap,nagano/yamanouchi/yomase-onsen,yamagata/tsuruoka/yudonosan,nagano/tomi/yunomaru,niigata/yuzawa/yuzawa-kogen,niigata/yuzawa/yuzawa-nakazato,niigata/yuzawa/yuzawa-park,yamagata/kaminoyama/zao-liza-world,yamagata/yamagata/zao-onsen,,","網走レークビュー,ルスツリゾート,エイブル白馬五竜,あだたら高原,会津高原だいくら,会津高原南郷,会津高原高畑,会津高原たかつえ,赤倉観光リゾート,赤倉温泉,赤沢,秋田八幡平,網張温泉,阿仁,安平山,青森スプリング・スキーリゾート,安比,あさひプライム,Asahi自然観スノーパーク,アサマ2000パーク,朝里川温泉,美唄国設,キャンモアスキービレッジ,シャルマン火打,シャトー塩沢,シャトレーゼスキーリゾート八ヶ岳,ちくさ高原,鳥海高原 矢島,中央道 伊那スキーリゾート,キューピットバレイ,ダイナランド,エーデルワイススキーリゾート,えんがるロックバレー,フェアリーランドかねやま,ファミリーゲレンデ 霧ヶ峰,富士見パノラマリゾート,ふじてんスノーリゾート,藤原,フジヤマ スノーリゾート イエティ,富良野,GALA湯沢,芸北国際,夏油高原,五ヶ瀬ハイランド,グランデコスノーリゾート,グランディ羽鳥湖スキーリゾート,GRANSNOW奥伊吹,グリーンピア大沼,郡上ヴァカンス村,ハチ北高原,ハチ高原,八幡平リゾートパノラマ,八幡平市田山,萩の山市民,羽黒山,八海山麓,八甲田,函館七飯スノーパーク,箱館山,Hakuba47ウインタースポーツパーク,白馬コルチナ,白馬八方尾根,白馬岩岳スノーフィールド,白馬乗鞍温泉,白馬さのさか,HAKUBA VALLEY鹿島槍,白山一里野温泉,白山セイモア,花笠高原,花輪,ひだ舟山スノーリゾートアルコピア,日高国際,平谷高原,平湯温泉,ひるがの高原,ひるぜんベアバレー,ひるぜんキッズスノーパーク,北海道グリーンランド ホワイトパーク,アルツ磐梯,星野リゾート トマム,星野リゾート 裏磐梯猫魔,ほおのき平,ハンターマウンテン塩原,氷ノ山国際,ハイパーボウル東鉢,いいづなリゾート,井川スキー場腕山,池の平温泉,今庄365,猪苗代,猪苗代リゾート,イオックス・アローザ,石打花岡,石打丸山,石鎚,岩木山百沢,岩原,岩手高原スノーパーク,ジュネス栗駒,治部坂高原,爺ガ岳,上越国際,鏡ヶ成,かぐら,開田高原マイア,カムイスキーリンクス,神室,神立スノーリゾート,軽井沢プリンスホテル,軽井沢スノーパーク,川場,鹿沢スノーエリア,キロロスノーワールド,北志賀小丸山,北信州 木島平,北見若松市民,越路,小出,国設芦別,国設ほろたち,駒ヶ根高原,琴引フォレストパーク,小海リエックス・スキーバレー,九重森林公園,久万スキーランド,国見平,国境高原スノーパーク,黒伏高原スノーパーク ジャングル・ジャングル,黒姫高原スノーパーク,車山高原SKYPARK,草津温泉,朽木スノーパーク,休暇村妙高ルンルン,リステル スキーファンタジア,斑尾高原,舞子スノーリゾート,まかど温泉,万場,万座温泉,丸沼高原,増毛町営暑寒別岳,まつだいファミリー,松之山温泉,女鹿平温泉めがひら,めいほう,メムロ,水上宝台樹,水上高原スキーリゾート,南富良野,箕輪,みやぎ蔵王えぼし,みやぎ蔵王白石,宮城蔵王すみかわスノーパーク,瑞穂ハイランド,モンデウス飛騨位山スノーパーク,マウントレースイ,モヤヒルズ,Mtグランビュー,マウントジーンズ那須,Mt.乗鞍スノーリゾート,ムイカ スノーリゾート,六日町八海山,むつ市釜臥山,妙高スキーパーク,妙高杉ノ原,苗場,なかさと清津,鉛温泉,名寄ピヤシリ,ニューグリーンピア津南,二本松塩沢,日光湯元温泉,ニノックススノーパーク,ニセコアンヌプリ国際,ニセコマウンテンリゾートグラン・ヒラフ,ニセコビレッジスキーリゾート,野麦峠,ノルン水上,ノーザンアークリゾート,野沢温泉,ぬかびら源泉郷,沼尻,オグナほたか,おじろ,奥神鍋,奥中山高原,奥利根スノーパーク,オニコウベ,おんたけ2240,恐羅漢スノーパーク,小樽天狗山,音威富士,大鰐温泉,パルコール嬬恋リゾート,ピラタス蓼科スノーリゾート,ぴっぷ,ピリカ,リバウェル井川,竜王スキーパーク,サホロリゾート,さかえ倶楽部,佐久スキーガーデンパラダ,サンタプレゼントパーク・マロースゲレンデ,ばんけいの森 さっぽろばんけい,札幌国際,サッポロテイネ,関温泉,標津町営金山,七戸町営,志賀高原 ジャイアント,志賀高原 東館山,志賀高原 発哺ブナ平,志賀高原 一の瀬ダイヤモンド,志賀高原 一の瀬ファミリー,志賀高原 熊の湯,志賀高原 西館山,志賀高原 奥志賀高原,志賀高原 サンバレー,志賀高原 高天ヶ原マンモス,志賀高原 タンネの森 オコジョ,志賀高原 寺小屋,志賀高原 焼額山,志賀高原 横手山,しらかば2in1,白樺リゾート池の平スノーパーク,白樺湖ロイヤルヒル,雫石,スキージャム勝山,スカイバレイ,スノークルーズオーンズ,スノーパーク尾瀬戸倉,スノーウェーブパーク白鳥高原,SOL-FAオダスキーゲレンデ,スプリングバレー泉高原,セントメリー,スターシュプール緑風リゾートひだ流葉,菅平高原スノーリゾート,須原,水晶山,サンメドウズ清里,サンライバ,太平山 オーパス,たいら,タカンボー,高鷲スノーパーク,滝上町桜ヶ丘,たんばらスキーパーク,タングラムスキーサーカス,谷川天神平,たらのきだい,蓼科東急,たざわ湖,天童高原,天下森,天元台高原,戸隠,戸狩温泉,となみ夢の平,十和田湖温泉,栂池高原,宇奈月温泉,アップかんなべ,ユートピアサイオト,わかさ氷ノ山,鷲ヶ岳,ホワイトピアたかす,ホワイトバレー,ホワイトワールド尾瀬岩鞍,ウイングヒルズ白鳥リゾート,X-JAM高井富士,やぶはら高原,八千穂高原,薬師,YAMABOKUワイルドスノーパーク,やまがた赤倉温泉,やわたハイランド191リゾート,余呉高原リゾートヤップ,よませ温泉,湯殿山,湯の丸,湯沢高原,湯沢中里スノーリゾート,湯沢パーク,蔵王ライザワールド,蔵王温泉,,","(北海道 網走市),(北海道 留寿都村),(長野県 白馬村),(福島県 二本松市),(福島県 南会津町),(福島県 南会津町),(福島県 南会津町),(福島県 南会津町),(新潟県 妙高市),(新潟県 妙高市),(群馬県 みなかみ町),(秋田県 鹿角市),(岩手県 雫石町),(秋田県 北秋田市),(北海道 安平町),(青森県 鰺ヶ沢町),(岩手県 八幡平町),(長野県 朝日村),(山形県 朝日町),(長野県 小諸市),(北海道 小樽市),(北海道 美唄町),(北海道 東川町),(新潟県 糸魚川市),(新潟県 南魚沼市),(長野県 川上村),(兵庫県 宍粟市),(秋田県 由利本荘市),(長野県 伊那市),(新潟県 上越市),(岐阜県 郡上市),(栃木県 日光市),(北海道 遠軽町),(福島県 金山町),(長野県 諏訪市),(長野県 富士見町),(山梨県 鳴沢村),(群馬県 みなかみ町),(静岡県 裾野市),(北海道 富良野市),(新潟県 湯沢町),(広島県 北広島町),(岩手県 北上町),(宮崎県 五ヶ瀬町),(福島県 北塩原村),(福島県 天栄村),(滋賀県 米原市),(北海道 森町),(岐阜県 郡上市),(兵庫県 香美町),(兵庫県 養父市),(岩手県 八幡平町),(岩手県 八幡平町),(北海道 岩見沢市),(山形県 鶴岡市),(新潟県 南魚沼市),(青森県 青森市),(北海道 七飯町),(滋賀県 高島市),(長野県 白馬村),(長野県 小谷村),(長野県 白馬村),(長野県 白馬村),(長野県 小谷村),(長野県 白馬村),(長野県 大町市),(石川県 白山市),(石川県 白山市),(山形県 尾花沢市),(秋田県 鹿角市),(岐阜県 高山市),(北海道 日高町),(長野県 平谷村),(岐阜県 高山市),(岐阜県 郡上市),(岡山県 真庭市),(岡山県 真庭市),(北海道 岩見沢市),(福島県 磐梯町),(北海道 占冠村),(福島県 北塩原村),(岐阜県 高山市),(栃木県 那須塩原市),(兵庫県 養父市),(兵庫県 養父市),(長野県 飯綱町),(徳島県 三好市),(新潟県 妙高市),(福井県 南越前町),(福島県 猪苗代町),(福島県 猪苗代町),(富山県 南砺市),(新潟県 南魚沼市),(新潟県 南魚沼市),(愛媛県 西条市),(青森県 弘前市),(新潟県 湯沢町),(岩手県 雫石町),(秋田県 東成瀬村),(長野県 阿智村),(長野県 大町市),(新潟県 南魚沼市),(鳥取県 江府町),(新潟県 湯沢町),(長野県 木曽町),(北海道 旭川市),(山形県 金山町),(新潟県 湯沢町),(長野県 軽井沢町),(群馬県 長野原町),(群馬県 川場村),(群馬県 嬬恋村),(北海道 赤井川村),(長野県 山之内町),(長野県 木島平村),(北海道 北見市),(岩手県 奥州町),(新潟県 魚沼市),(北海道 芦別市),(北海道 幌加内町),(長野県 駒ヶ根市),(島根県 飯南町),(長野県 小海町),(大分県 九重町),(愛媛県 久万高原町),(岩手県 奥州町),(滋賀県 高島市),(山形県 東根市),(長野県 信濃町),(長野県 茅野市),(群馬県 草津町),(滋賀県 高島市),(新潟県 妙高市),(福島県 猪苗代町),(長野県 飯山市),(新潟県 南魚沼市),(青森県 野辺地町),(兵庫県 豊岡市),(群馬県 嬬恋村),(群馬県 片品村),(北海道 増毛町),(新潟県 十日町市),(新潟県 十日町市),(広島県 廿日市市),(岐阜県 郡上市),(北海道 芽室町),(群馬県 みなかみ町),(群馬県 みなかみ町),(北海道 南富良野町),(福島県 猪苗代町),(宮城県 蔵王町),(宮城県 白石市),(宮城県 蔵王町),(島根県 邑南町),(岐阜県 高山市),(北海道 夕張市),(青森県 青森市),(新潟県 南魚沼市),(栃木県 那須町),(長野県 松本市),(新潟県 南魚沼市),(新潟県 南魚沼市),(青森県 むつ市),(新潟県 妙高市),(新潟県 妙高市),(新潟県 湯沢町),(新潟県 十日町市),(岩手県 花巻町),(北海道 名寄市),(新潟県 津南町),(福島県 二本松市),(栃木県 日光市),(新潟県 新発田市),(北海道 ニセコ町),(北海道 倶知安町),(北海道 ニセコ町),(長野県 松本市),(群馬県 みなかみ町),(北海道 北見市),(長野県 野沢温泉村),(北海道 上士幌町),(福島県 猪苗代町),(群馬県 片品村),(兵庫県 香美町),(兵庫県 豊岡市),(岩手県 一戸町),(群馬県 みなかみ町),(宮城県 大崎市),(長野県 王滝村),(広島県 安芸太田町),(北海道 小樽市),(北海道 音威子府村),(青森県 大鰐町),(群馬県 嬬恋村),(長野県 茅野市),(北海道 比布町),(北海道 今金町),(静岡県 静岡市),(長野県 山之内町),(北海道 新得町),(長野県 栄村),(長野県 佐久市),(北海道 旭川市),(北海道 札幌市),(北海道 札幌市),(北海道 札幌市),(新潟県 妙高市),(北海道 標津町),(青森県 七戸町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 山之内町),(長野県 立科町),(長野県 茅野市),(長野県 茅野市),(岩手県 雫石町),(福井県 勝山市),(兵庫県 香美町),(北海道 小樽市),(群馬県 片品村),(岐阜県 郡上市),(愛媛県 内子町),(宮城県 仙台市),(宮城県 川崎町),(岐阜県 飛騨市),(長野県 上田市),(新潟県 魚沼市),(秋田県 鹿角市),(山梨県 北杜市),(北海道 登別市),(秋田県 秋田市),(富山県 南砺市),(富山県 南砺市),(岐阜県 郡上市),(北海道 滝上町),(群馬県 沼田市),(長野県 信濃町),(群馬県 みなかみ町),(山形県 鶴岡市),(長野県 茅野市),(秋田県 仙北市),(山形県 天童市),(秋田県 横手市),(山形県 米沢市),(長野県 長野市),(長野県 飯山市),(富山県 砺波市),(青森県 十和田市),(長野県 小谷村),(富山県 黒部市),(兵庫県 豊岡市),(広島県 北広島町),(鳥取県 若桜町),(岐阜県 郡上市),(岐阜県 郡上市),(群馬県 みなかみ町),(群馬県 片品村),(岐阜県 郡上市),(長野県 山之内町),(長野県 木曽町),(長野県 佐久穂町),(新潟県 魚沼市),(長野県 高山村),(山形県 最上町),(広島県 北広島町),(滋賀県 長浜市),(長野県 山之内町),(山形県 鶴岡市),(長野県 東御市),(新潟県 湯沢町),(新潟県 湯沢町),(新潟県 湯沢町),(山形県 上山市),(山形県 山形市),,"]

names = data[0].split(',')
towns = data[1].split(',')
prefectures = data[2].split(',')
latitudes = data[3].split(',')
longitudes = data[4].split(',')
url_paths = data[5].split(',')
names_ja = data[6].split(',')
addresses_ja = data[7].split(',')

puts 'Creating resorts with basic info...'

i = 0
until i == 285 do
  Resort.create(
    name: names[i],
    town: towns[i],
    prefecture: prefectures[i],
    latitude: latitudes[i],
    longitude: longitudes[i],
    url_path: url_paths[i],
    name_ja: names_ja[i],
    address_ja: addresses_ja[i]
  )
i+=1
end

puts 'Finished creating resorts with basic info...'

def more_details(resort)
  html = open("https://www.snowjapan.com/japan-ski-resorts/#{resort.url_path}").read
  doc = Nokogiri::HTML(html)

  resort.snow_depth = doc.xpath("//div[@class='current-snow-depth-box-body-data']/text()")[0].text.to_i
  resort.snow_change = doc.xpath("//div[@class='current-snow-depth-box-body-dif']/text()")[0].text.gsub(/[^0-9,-]/, '').to_i
  resort.url = doc.css('div#information a').map { |link| link['href'] }[0]
  resort.advanced = doc.css('div.percent1').text.to_i
  resort.intermediate = doc.css('div.percent2').text.to_i
  resort.beginner = doc.css('div.percent3').text.to_i
  resort.percent_snowboards = doc.css('td.ski-snowbard').map { |each| each.text }[1].gsub(/[^0-9]/, '').to_i
  resort.phone_number = doc.css('table#more-info td').map { |each| each.text }[-1]
  resort.adult_price = doc.css('table.lift-ticket-charges td').map { |each| each.text }[1].gsub(/[^0-9]/, '').to_i
  resort.child_price = doc.css('table.lift-ticket-charges td').map { |each| each.text }[3].gsub(/[^0-9]/, '').to_i
  resort.season_planned = doc.css('div.season-planned').map { |each| each.text }[0].gsub(/\s+/, " ").strip
  resort.top_elevation = doc.css('td.mountain-data-holder td').map { |each| each.text }[0].split(' ')[0].gsub(/[^0-9]/, '').to_i
  resort.bottom_elevation = doc.css('td.mountain-data-holder td').map { |each| each.text }[0].split(' ')[2].gsub(/[^0-9]/, '').to_i
  resort.courses = doc.css('td.mountain-data-holder td').map { |each| each.text }[1].split(' ')[1].gsub(/[^0-9]/, '').to_i
  resort.longest_course = doc.css('td.mountain-data-holder td').map { |each| each.text }[1].split(' ')[2].gsub(/[^0-9]/, '').to_i
  resort.lifts = doc.css('tr#lift-number-row td').map { |each| each.text }.join.split(' ').map { |num| num.to_i }.sum
  resort.ski_school = (doc.css('div#facilities tr').map { |each| each.text }[1].split(' ')[3] == 'Available')
  resort.sb_school = (doc.css('div#facilities tr').map { |each| each.text }[1].split(' ')[6] == 'Available')
  resort.child_care = not(doc.css('div#facilities tr').map { |each| each.text }[9].split(' ').join.include?('nospecialfacilities'))
end

Resort.all.each do |resort|
  puts "Scraping additional info for #{resort.name}"
  more_details(resort)
  resort.save
end

puts 'Finished seeding resorts...'

def weather_api(resort)
  api_response = open("https://api.openweathermap.org/data/2.5/forecast/daily?lat=#{resort.latitude}&lon=#{resort.longitude}&appid=#{ENV['OPENWEATHER_API_KEY']}&units=metric").read
  weather = JSON.parse(api_response)

  i = 0

  4.times do
    day = weather['list'][i]
    p Time.at(day['dt'])
    forecast = Forecast.create(
      resort: resort,
      forecast_day: Time.at(day['dt']),
      max_temperature: day['temp']['max'],
      min_temperature: day['temp']['min'],
      wind_speed: day['speed'],
      wind_direction: deg_to_compass(day['deg']),
      weather: day['weather'][0]['description'],
      snow_amount: day['snow'].nil? ? 0 : day['snow'],
      rain: day['rain'].nil? ? 0 : day['rain']
      )
    i += 1
  end
end

def deg_to_compass(deg)
  val = ((deg / 22.5) + 0.5).floor
  sym = ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW']
  sym[(val % 16)]
end

puts "Creating weather forecasts"

Resort.all.each do |resort|
  weather_api(resort)
end

puts "Finished creating weather forecasts"
