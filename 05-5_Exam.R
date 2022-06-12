## 분석 도전
## ggplot2 패키지에는 미국 동부중부 437개 지역의 인구통계 정보를 담은 midwest라는 데이터가 들어 있습니다. midewest 데이터를 사용해 데이터 분석 문제를 해결해 보시오.

## 문제 1: ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러온 다음 데이터의 특징을 파악하세요.
install.packages("ggplot2")
library(ggplot2)

midwest <- as.data.frame(ggplot2::midwest)
midwest

head(midwest)
#   PID    county state  area poptotal popdensity popwhite popblack popamerindian popasian popother percwhite  percblack percamerindan  percasian  percother popadults  perchsd percollege percprof poppovertyknown percpovertyknown percbelowpoverty percchildbelowpovert percadultpoverty percelderlypoverty inmetro category
# 1 561     ADAMS    IL 0.052    66090  1270.9615    63917     1702            98      249      124  96.71206  2.5752761     0.1482826 0.37675897 0.18762294     43298 75.10740   19.63139 4.355859           63628         96.27478        13.151443             18.01172        11.009776          12.443812       0      AAR
# 2 562 ALEXANDER    IL 0.014    10626   759.0000     7054     3496            19       48        9  66.38434 32.9004329     0.1788067 0.45172219 0.08469791      6724 59.72635   11.24331 2.870315           10529         99.08714        32.244278             45.82651        27.385647          25.228976       0      LHR
# 3 563      BOND    IL 0.022    14991   681.4091    14477      429            35       16       34  96.57128  2.8617170     0.2334734 0.10673071 0.22680275      9669 69.33499   17.03382 4.488572           14235         94.95697        12.068844             14.03606        10.852090          12.697410       0      AAR
# 4 564     BOONE    IL 0.017    30806  1812.1176    29344      127            46      150     1139  95.25417  0.4122574     0.1493216 0.48691813 3.69733169     19272 75.47219   17.27895 4.197800           30337         98.47757         7.209019             11.17954         5.536013           6.217047       1      ALU
# 5 565     BROWN    IL 0.018     5836   324.2222     5264      547            14        5        6  90.19877  9.3728581     0.2398903 0.08567512 0.10281014      3979 68.86152   14.47600 3.367680            4815         82.50514        13.520249             13.02289        11.143211          19.200000       0      AAR
# 6 566    BUREAU    IL 0.050    35688   713.7600    35157       50            65      195      221  98.51210  0.1401031     0.1821340 0.54640215 0.61925577     23444 76.62941   18.90462 3.275891           35107         98.37200        10.399635             14.15882         8.179287          11.008586       0      AAR

summary(midwest)
#       PID          county             state                area            poptotal         popdensity          popwhite          popblack       popamerindian        popasian         popother        percwhite       percblack       percamerindan        percasian        percother         popadults          perchsd        percollege        percprof       poppovertyknown   percpovertyknown percbelowpoverty percchildbelowpovert percadultpoverty percelderlypoverty
#  Min.   : 561   Length:437         Length:437         Min.   :0.00500   Min.   :   1701   Min.   :   85.05   Min.   :    416   Min.   :      0   Min.   :    4.0   Min.   :     0   Min.   :     0   Min.   :10.69   Min.   : 0.0000   Min.   : 0.05623   Min.   :0.0000   Min.   :0.00000   Min.   :   1287   Min.   :46.91   Min.   : 7.336   Min.   : 0.5203   Min.   :   1696   Min.   :80.90    Min.   : 2.180   Min.   : 1.919       Min.   : 1.938   Min.   : 3.547
#  1st Qu.: 670   Class :character   Class :character   1st Qu.:0.02400   1st Qu.:  18840   1st Qu.:  622.41   1st Qu.:  18630   1st Qu.:     29   1st Qu.:   44.0   1st Qu.:    35   1st Qu.:    20   1st Qu.:94.89   1st Qu.: 0.1157   1st Qu.: 0.15793   1st Qu.:0.1737   1st Qu.:0.09102   1st Qu.:  12271   1st Qu.:71.33   1st Qu.:14.114   1st Qu.: 2.9980   1st Qu.:  18364   1st Qu.:96.89    1st Qu.: 9.199   1st Qu.:11.624       1st Qu.: 7.668   1st Qu.: 8.912
#  Median :1221   Mode  :character   Mode  :character   Median :0.03000   Median :  35324   Median : 1156.21   Median :  34471   Median :    201   Median :   94.0   Median :   102   Median :    66   Median :98.03   Median : 0.5390   Median : 0.21502   Median :0.2972   Median :0.17844   Median :  22188   Median :74.25   Median :16.798   Median : 3.8142   Median :  33788   Median :98.17    Median :11.822   Median :15.270       Median :10.008   Median :10.869
#  Mean   :1437                                         Mean   :0.03317   Mean   :  96130   Mean   : 3097.74   Mean   :  81840   Mean   :  11024   Mean   :  343.1   Mean   :  1310   Mean   :  1613   Mean   :95.56   Mean   : 2.6763   Mean   : 0.79894   Mean   :0.4872   Mean   :0.47906   Mean   :  60973   Mean   :73.97   Mean   :18.273   Mean   : 4.4473   Mean   :  93642   Mean   :97.11    Mean   :12.511   Mean   :16.447       Mean   :10.919   Mean   :11.389
#  3rd Qu.:2059                                         3rd Qu.:0.03800   3rd Qu.:  75651   3rd Qu.: 2330.00   3rd Qu.:  72968   3rd Qu.:   1291   3rd Qu.:  288.0   3rd Qu.:   401   3rd Qu.:   345   3rd Qu.:99.07   3rd Qu.: 2.6014   3rd Qu.: 0.38362   3rd Qu.:0.5212   3rd Qu.:0.48050   3rd Qu.:  47541   3rd Qu.:77.20   3rd Qu.:20.550   3rd Qu.: 4.9493   3rd Qu.:  72840   3rd Qu.:98.60    3rd Qu.:15.133   3rd Qu.:20.352       3rd Qu.:13.182   3rd Qu.:13.412
#  Max.   :3052                                         Max.   :0.11000   Max.   :5105067   Max.   :88018.40   Max.   :3204947   Max.   :1317147   Max.   :10289.0   Max.   :188565   Max.   :384119   Max.   :99.82   Max.   :40.2100   Max.   :89.17738   Max.   :5.0705   Max.   :7.52427   Max.   :3291995   Max.   :88.90   Max.   :48.079   Max.   :20.7913   Max.   :5023523   Max.   :99.86    Max.   :48.691   Max.   :64.308       Max.   :43.312   Max.   :31.162
#     inmetro         category
#  Min.   :0.0000   Length:437
#  1st Qu.:0.0000   Class :character
#  Median :0.0000   Mode  :character
#  Mean   :0.3432
#  3rd Qu.:1.0000
#  Max.   :1.0000

tail(midwest)
View(midwest)

dim(midwest)
# [1] 437  28


str(midwest) # 속성
# 'data.frame':	437 obs. of  28 variables:
#  $ PID                 : int  561 562 563 564 565 566 567 568 569 570 ...
#  $ county              : chr  "ADAMS" "ALEXANDER" "BOND" "BOONE" ...
#  $ state               : chr  "IL" "IL" "IL" "IL" ...
#  $ area                : num  0.052 0.014 0.022 0.017 0.018 0.05 0.017 0.027 0.024 0.058 ...
#  $ poptotal            : int  66090 10626 14991 30806 5836 35688 5322 16805 13437 173025 ...
#  $ popdensity          : num  1271 759 681 1812 324 ...
#  $ popwhite            : int  63917 7054 14477 29344 5264 35157 5298 16519 13384 146506 ...
#  $ popblack            : int  1702 3496 429 127 547 50 1 111 16 16559 ...
#  $ popamerindian       : int  98 19 35 46 14 65 8 30 8 331 ...
#  $ popasian            : int  249 48 16 150 5 195 15 61 23 8033 ...
#  $ popother            : int  124 9 34 1139 6 221 0 84 6 1596 ...
#  $ percwhite           : num  96.7 66.4 96.6 95.3 90.2 ...
#  $ percblack           : num  2.575 32.9 2.862 0.412 9.373 ...
#  $ percamerindan       : num  0.148 0.179 0.233 0.149 0.24 ...
#  $ percasian           : num  0.3768 0.4517 0.1067 0.4869 0.0857 ...
#  $ percother           : num  0.1876 0.0847 0.2268 3.6973 0.1028 ...
#  $ popadults           : int  43298 6724 9669 19272 3979 23444 3583 11323 8825 95971 ...
#  $ perchsd             : num  75.1 59.7 69.3 75.5 68.9 ...
#  $ percollege          : num  19.6 11.2 17 17.3 14.5 ...
#  $ percprof            : num  4.36 2.87 4.49 4.2 3.37 ...
#  $ poppovertyknown     : int  63628 10529 14235 30337 4815 35107 5241 16455 13081 154934 ...
#  $ percpovertyknown    : num  96.3 99.1 95 98.5 82.5 ...
#  $ percbelowpoverty    : num  13.15 32.24 12.07 7.21 13.52 ...
#  $ percchildbelowpovert: num  18 45.8 14 11.2 13 ...
#  $ percadultpoverty    : num  11.01 27.39 10.85 5.54 11.14 ...
#  $ percelderlypoverty  : num  12.44 25.23 12.7 6.22 19.2 ...
#  $ inmetro             : int  0 0 0 1 0 0 0 0 0 1 ...
#  $ category            : chr  "AAR" "LHR" "AAR" "ALU" ...


## 문제2: poptotal (전체인구) 변수를 total로, popasian (아시아 인구) 변수를 asian으로 수정하세요
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)
str(midwest)
#  'data.frame':	437 obs. of  28 variables:
#  $ PID                 : int  561 562 563 564 565 566 567 568 569 570 ...
#  $ county              : chr  "ADAMS" "ALEXANDER" "BOND" "BOONE" ...
#  $ state               : chr  "IL" "IL" "IL" "IL" ...
#  $ area                : num  0.052 0.014 0.022 0.017 0.018 0.05 0.017 0.027 0.024 0.058 ...
#  $ total               : int  66090 10626 14991 30806 5836 35688 5322 16805 13437 173025 ...
#  $ popdensity          : num  1271 759 681 1812 324 ...
#  $ popwhite            : int  63917 7054 14477 29344 5264 35157 5298 16519 13384 146506 ...
#  $ popblack            : int  1702 3496 429 127 547 50 1 111 16 16559 ...
#  $ popamerindian       : int  98 19 35 46 14 65 8 30 8 331 ...
#  $ asian               : int  249 48 16 150 5 195 15 61 23 8033 ...
#  $ popother            : int  124 9 34 1139 6 221 0 84 6 1596 ...
#  $ percwhite           : num  96.7 66.4 96.6 95.3 90.2 ...
#  $ percblack           : num  2.575 32.9 2.862 0.412 9.373 ...
#  $ percamerindan       : num  0.148 0.179 0.233 0.149 0.24 ...
#  $ percasian           : num  0.3768 0.4517 0.1067 0.4869 0.0857 ...
#  $ percother           : num  0.1876 0.0847 0.2268 3.6973 0.1028 ...
#  $ popadults           : int  43298 6724 9669 19272 3979 23444 3583 11323 8825 95971 ...
#  $ perchsd             : num  75.1 59.7 69.3 75.5 68.9 ...
#  $ percollege          : num  19.6 11.2 17 17.3 14.5 ...
#  $ percprof            : num  4.36 2.87 4.49 4.2 3.37 ...
#  $ poppovertyknown     : int  63628 10529 14235 30337 4815 35107 5241 16455 13081 154934 ...
#  $ percpovertyknown    : num  96.3 99.1 95 98.5 82.5 ...
#  $ percbelowpoverty    : num  13.15 32.24 12.07 7.21 13.52 ...
#  $ percchildbelowpovert: num  18 45.8 14 11.2 13 ...
#  $ percadultpoverty    : num  11.01 27.39 10.85 5.54 11.14 ...
#  $ percelderlypoverty  : num  12.44 25.23 12.7 6.22 19.2 ...
#  $ inmetro             : int  0 0 0 1 0 0 0 0 0 1 ...
#  $ category            : chr  "AAR" "LHR" "AAR" "ALU" ...

## 문제 3: total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생 ㅂ녀수를 추가하고, 히스토그램을 만들어 분포를 살펴보세요
midwest$totalPerAsian <- midwest$asian/midwest$total*100
head(midwest, 20)
#    PID     county state  area   total popdensity popwhite popblack popamerindian  asian popother percwhite   percblack percamerindan  percasian  percother popadults  perchsd percollege  percprof poppovertyknown percpovertyknown percbelowpoverty percchildbelowpovert percadultpoverty
# 1  561      ADAMS    IL 0.052   66090  1270.9615    63917     1702            98    249      124  96.71206  2.57527614    0.14828264 0.37675897 0.18762294     43298 75.10740   19.63139  4.355859           63628         96.27478        13.151443            18.011717        11.009776
# 2  562  ALEXANDER    IL 0.014   10626   759.0000     7054     3496            19     48        9  66.38434 32.90043290    0.17880670 0.45172219 0.08469791      6724 59.72635   11.24331  2.870315           10529         99.08714        32.244278            45.826514        27.385647
# 3  563       BOND    IL 0.022   14991   681.4091    14477      429            35     16       34  96.57128  2.86171703    0.23347342 0.10673071 0.22680275      9669 69.33499   17.03382  4.488572           14235         94.95697        12.068844            14.036061        10.852090
# 4  564      BOONE    IL 0.017   30806  1812.1176    29344      127            46    150     1139  95.25417  0.41225735    0.14932156 0.48691813 3.69733169     19272 75.47219   17.27895  4.197800           30337         98.47757         7.209019            11.179536         5.536013
# 5  565      BROWN    IL 0.018    5836   324.2222     5264      547            14      5        6  90.19877  9.37285812    0.23989034 0.08567512 0.10281014      3979 68.86152   14.47600  3.367680            4815         82.50514        13.520249            13.022889        11.143211
# 6  566     BUREAU    IL 0.050   35688   713.7600    35157       50            65    195      221  98.51210  0.14010312    0.18213405 0.54640215 0.61925577     23444 76.62941   18.90462  3.275891           35107         98.37200        10.399635            14.158819         8.179287
# 7  567    CALHOUN    IL 0.017    5322   313.0588     5298        1             8     15        0  99.54904  0.01878993    0.15031943 0.28184893 0.00000000      3583 62.82445   11.91739  3.209601            5241         98.47802        15.149781            13.787761        12.932331
# 8  568    CARROLL    IL 0.027   16805   622.4074    16519      111            30     61       84  98.29813  0.66051770    0.17851830 0.36298721 0.49985123     11323 75.95160   16.19712  3.055727           16455         97.91729        11.710726            17.225462        10.027037
# 9  569       CASS    IL 0.024   13437   559.8750    13384       16             8     23        6  99.60557  0.11907420    0.05953710 0.17116916 0.04465282      8825 72.27195   14.10765  3.206799           13081         97.35060        13.875086            17.994784        11.914343
# 10 570  CHAMPAIGN    IL 0.058  173025  2983.1897   146506    16559           331   8033     1596  84.67331  9.57029331    0.19130183 4.64268169 0.92241006     95971 87.49935   41.29581 17.757448          154934         89.54429        15.572437            14.132234        17.562728
# 11 571  CHRISTIAN    IL 0.042   34418   819.4762    34176       82            51     89       20  99.29688  0.23824743    0.14817828 0.25858562 0.05810913     22945 73.07474   13.56723  3.089998           33788         98.16956        11.708299            16.320612         9.569700
# 12 572      CLARK    IL 0.030   15921   530.7000    15842       10            26     36        7  99.50380  0.06281012    0.16330632 0.22611645 0.04396709     10734 71.33408   15.11086  2.776225           15615         98.07801        12.007685            15.321547        10.131775
# 13 573       CLAY    IL 0.028   14460   516.4286    14403        4            17     29        7  99.60581  0.02766252    0.11756570 0.20055325 0.04840941      9647 65.56442   13.68301  2.788432           14248         98.53389        16.774284            20.582578        14.464114
# 14 574    CLINTON    IL 0.029   33944  1170.4828    32688     1021            48    104       83  96.29979  3.00789536    0.14140938 0.30638699 0.24452039     21563 67.16598   15.38747  2.875296           32190         94.83267        10.223672            13.299402         9.253834
# 15 575      COLES    IL 0.030   51644  1721.4667    50177      925            92    341      109  97.15940  1.79110836    0.17814267 0.66028968 0.21106034     29136 76.10516   25.17504  8.144563           45693         88.47688        16.748736            16.341941        18.792914
# 16 576       COOK    IL 0.058 5105067 88018.3966  3204947  1317147         10289 188565   384119  62.77972 25.80077790    0.20154486 3.69368316 7.52426951   3291995 73.40582   28.01812  8.329964         5023523         98.40269        14.198303            22.293497        11.665542
# 17 577   CRAWFORD    IL 0.026   19464   748.6154    19300       63            34     48       19  99.15742  0.32367448    0.17468146 0.24660912 0.09761611     13317 76.03064   16.98581  3.334084           19123         98.24805        10.537050            13.809825         8.870243
# 18 578 CUMBERLAND    IL 0.020   10670   533.5000    10627        5             6     26        6  99.59700  0.04686036    0.05623243 0.24367385 0.05623243      6727 72.24617   14.59789  2.690650           10590         99.25023        12.049103            13.603185         9.822264
# 19 579    DE KALB    IL 0.038   77932  2050.8421    72968     2069           123   1751     1021  93.63034  2.65487861    0.15782990 2.24683057 1.31011651     41817 83.87976   32.83593 11.150967           69127         88.70169        13.544635             8.678238        17.047419
# 20 580    DE WITT    IL 0.023   16516   718.0870    16387       25            37     43       24  99.21894  0.15136837    0.22402519 0.26035360 0.14531364     10941 74.64583   16.19596  3.308656           16238         98.31678        10.315310            13.568426         7.955993
#    percelderlypoverty inmetro category 전체 인구 대비 아시아 인구 백분율
# 1           12.443812       0      AAR                      0.0037675897
# 2           25.228976       0      LHR                      0.0045172219
# 3           12.697410       0      AAR                      0.0010673071
# 4            6.217047       1      ALU                      0.0048691813
# 5           19.200000       0      AAR                      0.0008567512
# 6           11.008586       0      AAR                      0.0054640215
# 7           21.085271       0      LAR                      0.0028184893
# 8            9.525052       0      AAR                      0.0036298721
# 9           13.660180       0      AAR                      0.0017116916
# 10           8.105017       1      HAU                      0.0464268169
# 11          11.490641       0      AAR                      0.0025858562
# 12          12.595420       0      AAR                      0.0022611645
# 13          17.670078       0      LAR                      0.0020055325
# 14           8.323176       1      LAU                      0.0030638699
# 15          10.993608       0      AAR                      0.0066028968
# 16          10.825269       1      AAU                      0.0369368316
# 17          10.803387       0      AAR                      0.0024660912
# 18          15.284626       0      AAR                      0.0024367385
# 19           6.453908       1      HAU                      0.0224683057
# 20          12.255345       0      AAR                      0.0026035360

hist(midwest$totalPerAsian)


## 문제 4: 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 'large', 그 외에는 "small"을 부여하는 파생변수를 만드시오.
mean(midwest$totalPerAsian)
# [1] 0.004872462
midwest$totalPerAsianCategory <- ifelse(midwest$totalPerAsian > mean(midwest$totalPerAsian), "large", "small")
head(midwest)
#   PID    county state  area total popdensity popwhite popblack popamerindian asian popother percwhite  percblack percamerindan  percasian  percother popadults  perchsd percollege percprof poppovertyknown percpovertyknown percbelowpoverty percchildbelowpovert percadultpoverty percelderlypoverty inmetro category 전체 인구 대비 아시아 인구 백분율 totalPerAsian totalPerAsianCategory
# 1 561     ADAMS    IL 0.052 66090  1270.9615    63917     1702            98   249      124  96.71206  2.5752761     0.1482826 0.37675897 0.18762294     43298 75.10740   19.63139 4.355859           63628         96.27478        13.151443             18.01172        11.009776          12.443812       0      AAR                      0.0037675897  0.0037675897                 small
# 2 562 ALEXANDER    IL 0.014 10626   759.0000     7054     3496            19    48        9  66.38434 32.9004329     0.1788067 0.45172219 0.08469791      6724 59.72635   11.24331 2.870315           10529         99.08714        32.244278             45.82651        27.385647          25.228976       0      LHR                      0.0045172219  0.0045172219                 small
# 3 563      BOND    IL 0.022 14991   681.4091    14477      429            35    16       34  96.57128  2.8617170     0.2334734 0.10673071 0.22680275      9669 69.33499   17.03382 4.488572           14235         94.95697        12.068844             14.03606        10.852090          12.697410       0      AAR                      0.0010673071  0.0010673071                 small
# 4 564     BOONE    IL 0.017 30806  1812.1176    29344      127            46   150     1139  95.25417  0.4122574     0.1493216 0.48691813 3.69733169     19272 75.47219   17.27895 4.197800           30337         98.47757         7.209019             11.17954         5.536013           6.217047       1      ALU                      0.0048691813  0.0048691813                 small
# 5 565     BROWN    IL 0.018  5836   324.2222     5264      547            14     5        6  90.19877  9.3728581     0.2398903 0.08567512 0.10281014      3979 68.86152   14.47600 3.367680            4815         82.50514        13.520249             13.02289        11.143211          19.200000       0      AAR                      0.0008567512  0.0008567512                 small
# 6 566    BUREAU    IL 0.050 35688   713.7600    35157       50            65   195      221  98.51210  0.1401031     0.1821340 0.54640215 0.61925577     23444 76.62941   18.90462 3.275891           35107         98.37200        10.399635             14.15882         8.179287          11.008586       0      AAR                      0.0054640215  0.0054640215                 large


## 문제 5: "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
table(midwest$totalPerAsianCategory)
# large small
#   119   318
qplot(midwest$totalPerAsianCategory)




############ 정답
## 1.
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)
summary(midwest)

## 2.
library(dplyr)
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)

# 3.
midwest$ratio <- midwest$asian/midwest$total*100
hist(midwest$ratio)

# 4.
mean(midwest$ratio)
midwest$group <- ifelse(midwest$ratio > 0.4872462, "large", "small")

# 5.
table(midwest$group)
library(ggplot2)
qplot(midwest$group)


