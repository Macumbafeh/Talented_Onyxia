local Talented = _G.Talented

-------------------------------------------------------------------------------
-- spelldata.lua
--

-- Generated Data, do not modify
do
  local AllPets = {
    [1] = { --Great Stamina
      column = 1,
      row = 1,
      ranks = {
        [1] = 4188, [2] = 4189, [3] = 4190, [4] = 4191, [5] = 4192,
        [6] = 4193, [7] = 4194, [8] = 5041, [9] = 5042},
      },
    [4] = { --Natural Armor
      column = 1,
      row = 2,
      ranks = {
        [1] = 24549, [2] = 24550, [3] = 24551, [4] = 24552, [5] = 24553,
        [6] = 24554, [7] = 24555, [8] = 24629, [9] = 24630},
      },
    [5] = { --Cower
      column = 3,
      row = 2,
      ranks = {
        [1] = 1742, [2] = 1753, [3] = 1754, [4] = 1755, [5] = 1756, [6] = 16697},
      },
    [7] = { --Arcane Resistance
      column = 4,
      row = 3,
      ranks = {
        [1] = 24493, [2] = 24497, [3] = 24500, [4] = 24501},
      },
    [8] = { --Fire Resistance
      column = 1,
      row = 3,
      ranks = {
        [1] = 23992, [2] = 24439, [3] = 24444, [4] = 24445},
      },
    [9] = { --Frost Resistance
      column = 2,
      row = 3,
      ranks = {
        [1] = 24446, [2] = 24447, [3] = 24448, [4] = 24449},
      },
    [10] = { --Nature Resistance
      column = 3,
      row = 3,
      ranks = {
        [1] = 24492, [2] = 24502, [3] = 24503, [4] = 24504},
      },
    [11] = { --Shadow Resistance
      column = 1,
      row = 4,
      ranks = {
        [1] = 24488, [2] = 24505, [3] = 24507, [4] = 24506},
      },
    }
  local FamilySkills = {
    [2] = { --Bite
      column = 2, row = 1,
      ranks = {
        [1] = 17253, [2] = 17255, [3] = 17256, [4] = 17257,
        [5] = 17258, [6] = 17259, [7] = 17260, [8] = 17261},
      },
    [3] = { --Claw
      column = 3, row = 1,
      ranks = {
        [1] = 16827, [2] = 16828, [3] = 16829, [4] = 16830,
        [5] = 16831, [6] = 16832, [7] = 3010,  [8] = 3009},
      },
    [6] = { --Dash
      column = 4, row = 2,
      ranks = {
        [1] = 23099, [2] = 23109, [3] = 23110},
      },
    [12] = { --Dive
      column = 2, row = 2,
      ranks = {
        [1] = 23145, [2] = 23147, [3] = 23148},
      },
    [13] = { --Screech
      column = 4, row = 1,
      ranks = {
        [1] = 24423, [2] = 24577, [3] = 24578, [4] = 24579},
      },
    [14] = { --Charge
      column = 4, row = 1,
      ranks = {
        [1] = 7371, [2] = 26177, [3] = 26178, [4] = 26179, [5] = 26201, [6] = 27685},
      },
    [15] = { --Prowl
      column = 4, row = 1,
      ranks = {
        [1] = 24450, [2] = 24452, [3] = 24453},
      },
    [16] = { --Thunderstomp
      column = 4, row = 1,
      ranks = {
        [1] = 26090, [2] = 26187, [3] = 26188},
      },
    [17] = { --Scorpid Poison
      column = 4, row = 1,
      ranks = {
        [1] = 24640, [2] = 24583, [3] = 24586, [4] = 24587},
      },
    [18] = { --Shell Shield
      column = 4, row = 1,
      ranks = {
        [1] = 26064},
      },
    [19] = { --Lightning Breath
      column = 4, row = 1,
      ranks = {
        [1] = 24844, [2] = 25008, [3] = 25009, [4] = 25010, [5] = 25011, [6] = 25012},
      },
    [20] = { --Furious Howl
      column = 4, row = 1,
      ranks = {
        [1] = 24604, [2] = 24605, [3] = 24603, [4] = 24597},
      },
    }
 
  local function deep_copy(t, seen)
    local result = {}
    seen = seen or {}
    seen[t] = result
    for key, value in pairs(t) do
        if type(value) == "table" then
            result[key] = seen[value] or deep_copy(value, seen)
        else
            result[key] = value
        end
    end
    return result
  end
 
	local spelldata = {
    --[[legend:
    ! = move over 1 talent box
    ' = new line and 2 boxes over
    " = tab over 2 boxes
    | = next tree
    ; = next rank    
    , = next talent square
    % = force next line
    & = force next line and 1 box over
    a-i = require talent letter count back in the list
    --]]
		--no DK in Vanilla
--    DEATHKNIGHT = "",
		WARRIOR = --Arms tree
    "12282;12663;12664,16462;16463;16464;16465;16466,12286;12658;12659,"..
    "%12285;12697,12295;12676;12677;12678;12679,!12287;12665;12666,"..
    "12290;12963,c12296,f12834;12849;12867,"..
    "&12163;12711;12712;12713;12714,b16493;16494,"..
    "%12700;12781;12783;12784;12785,12292,12284;12701;12702;12703;12704,12281;12812;12813;12814;12815,"..
    "12165;12830;12831;12832;12833,!12289;12668;23695,"..
    "&e12294|"..
    --Fury Tree
    "!12321;12835;12836;12837;12838,12320;12852;12853;12855;12856,"..
    "&12324;12876;12877;12878;12879,12322;12999;13000;13001;13002,"..
    "%12329;12950;20496,12323,16487;16489;16492,12318;12857;12858;12860;12861,"..
    "23584;23585;23586;23587;23588,20502;20503,12317;13045;13046;13047;13048,"..
    "%12862;12330;20497;20498;20499,12328,!20504;20505,"..
    "20500;20501,!e12319;12971;12972;12973;12974,"..
    "&d23881|"..
    --Prot Tree
    "!12298;12724;12725;12726;12727,12297;12750;12751;12752;12753,"..
    "%12301;12818,!12299;12761;12762;12763;12764,12300;12959;12960;12961;12962,"..
    "c12975,f12945;12307;12944,12797;12799;12800,12303;12788;12789;12791;12792,"..
    "12308;12810;12811,12313;12804;12807,12302;12765,"..
    "%12312;12803,12809,12311;12985,"..
    "'16538;16539;16540;16541;16542,"..
    "&c23922",
		ROGUE = --Assassination Tree
    '14162;14163;14164,14144;14148,14138;14139;14140;14141;14142,'..
    '%14156;14160;14161,14158;14159,!14165;14166;14167,'..
    '14179,14168;14169,f14128;14132;14135;14136;14137,'..
    '&16513;16514;16515;16719;16720,14113;14114;14115;14116;14117,'..
    '&14177,14174;14175;14176,'..
    '&b14186;14190;14193;14194;14195,'..
    '&14983|'..
    --Combat Tree
    '13741;13793;13792,13732;13863,13712;13788;13789;13790;13791,'..
    '%13733;13865;13866,13713;13853;13854;13855;13856,13705;13832;13843;13844;13845,'..
    '%13742;13872,c14251,!13743;13875,'..
    '13754;13867,13706;13804;13805;13806;13807,f13715;13848;13849;13851;13852,'..
    '%13709;13800;13801;13802;13803,13877,13960;13961;13962;13963;13964,13707;13966;13967;13968;13969,'..
    '!c30919;30920,18427;18428;18429,'..
    '&13750|'..
    --Subtlety tree
    '!13958;13970;13971;13972;13973,14057;14072;14073;14074;14075,'..
    '%30892;30893,13981;14066,13975;14062;14063;14064;14065,'..
    '%13976;13979;13980,14278,14079;14080;14081,'..
    '%13983;14070;14071,14076;14094;14095,14171;14172;14173,'..
    '%30894;30895,14185,14082;14083,d16511,'..
    '"30902;30903;30904;30905;30906,'..
    '&d14183',
		MAGE = --arcane tree
    "11210;12592,11222;12839;12840;12841;12842,11237;12463;12464;16769;16770,".. 
    "%6057;6085,29441;29444;29445;29446;29447,11213;12574;12575;12576;12577,"..
    "%11247;12606,11242;12467;12469,28574,"..
    "%11252;12605,11255;12598,!18462;18463;18464,"..
    "!12043,e11232;12500;12501;12502;12503,".. 
    "&b15058;15059;15060,"..
    "&a12042|"..
    --fire tree
    "!11069;12338;12339;12340;12341,11103;12357;12358;12359;12360,"..
    "%11119;11120;12846;12847;12848,11100;12353,11078;11080;12342,"..
    "%18459;18460,11108;12349;12350,11366,11083;12351,"..
    "11095;12872;12873,11094;13043,!29074;29075;29076,"..
    "!11115;11367;11368,f11113,"..
    "'11124;12378;12398;12399;12400,"..
    "&c11129|"..
    --frost tree
    "11189;28332,11070;12473;16763;16765;16766,29438;29439;29440,"..
    "%11207;12672;15047;15052;15053,11071;12496;12497,11165;12475,11175;12569;12571,"..
    "11151;12952;12953,12472,!11185;12487;12488,"..
    "16757;16758,11160;12518;12519,g11170;12982;12983;12984;12985,"..
    "&11958,11190;12489;12490,"..
    "'11180;28592;28593;28594;28595,"..
    "&c11426",
		PRIEST = --disc
    "!14522;14788;14789;14790;14791,14524;14525;14526;14527;14528,"..
    "%14523;14784;14785;14786;14787,14749;14767,14748;14768;14769,14531;14774,"..
    "!14751,14521;14776;14777,"..
    "%14747;14770;14771,14520;14780;14781;14782;14783,!14750;14772,"..
    "!18551;18552;18553;18554;18555,e14752,"..
    "'18544;18547;18548;18549;18550,"..
    "&c10060|"..
    --holy
    "14913;15012,14908;15020;17191,14889;15008;15009;15010;15011,"..
    "&27900;27901;27902;27903;27904,18530;18531;18533;18534;18535,"..
    "%15237,27811;27815;27816,!14892;15362;15363,"..
    "27789;27790,14912;15013;15014,f14909;15017,"..
    "%14911;15018,20711,14901;15028;15029;15030;15031,"..
    "'14898;15349;15354;15355;15356,"..
    "&c724|"..
    --shadow
    "!15270;15335;15336;15337;15338,15268;15323;15324;15325;15326,"..
    "%15318;15272;15320,15275;15317,15260;15327;15328;15329;15330,"..
    "%15392;15448,15273;15312;15313;15314;15316,15407,"..
    "&15274;15311,17322;17323;17325,15257;15331;15332;15333;15334,"..
    "f15487,15286,a27839;27840,"..
    "'15259;15307;15308;15309;15310,"..
    "&c15473",
		WARLOCK = --afflic
    '!18174;18175;18176;18177;18178,17810;17811;17812;17813;17814,'..
    '%18179;18180;18181,18213;18372,18182;18183,17804;17805;17806;17807;17808,'..
    '18827;18829;18830,17783;17784;17785;17786;17787,18288,'..
    '%18218;18219,18094;18095,!17864;18393,'..
    '!18265,e18223,a18310;18311;18312;18313,'..
    '!c18271;18272;18273;18274;18275,'..
    '&18220|'..
    --Demo 
    '18692;18693,18694;18695;18696,18697;18698;18699;18700;18701,'..
    '%18703;18704,18705;18706;18707,18731;18743;18744;18745;18746,'..
    '%18754;18755;18756,18708,18748;18749;18750;18751;18752,'..
    '&b18709;18710,18769;18770;18771;18772;18773,'..
    '%18821;18822;18823;18824;18825,18788,!18767;18768,'..
    '"d23785;23822;23823;23824;23825,'..
    '&c19028,18774;18775|'.. 
    --destro
    "!17793;17796;17801;17802;17803,17778;17779;17780;17781;17782,"..
    "&17788;17789;17790;17791;17792,18119;18120;18121;18122;18123,"..
    "%18126;18127,18128;18129,18130;18131;18132;18133;18134,17877,"..
    "18135;18136,17917;17918,!17927;17929;17930;17931;17932,"..
    "c18096;18073,17815;17833;17834;17835;17836,g17959,"..
    "'17954;17955;17956;17957;17958,"..
    "&c17962",
		HUNTER = --bm
    '!19552;19553;19554;19555;19556,19583;19584;19585;19586;19587,'..
    '%19557;19558,19549;19550;19551;24386;24387,19609;19610;19612,24443;19575,'..
    '19559;19560,19596,19616;19617;19618;19619;19620,'..
    '&19572;19573,19598;19599;19600;19601;19602,'..
    '%19578;20895,19577,!19590;19592,'..
    '"d19621;19622;19623;19624;19625,'..
    '&c19574|'.. 
    --mm
    "!19407;19412;19413;19414;19415,19416;19417;19418;19419;19420,"..
    "&19421;19422;19423;19424;19425,19426;19427;19429;19430;19431,"..
    "%19434,19454;19455;19456;19457;19458,!19498;19499;19500,"..
    "!19464;19465;19466;19467;19468,e19485;19487;19488;19489;19490,"..
    "%19503,19461;19462;24691,19491;19493;19494,"..
    "'19507;19508;19509;19510;19511,"..
    "&c19506|"..
    --surv
    "24293;24294;24295,19151;19152;19153,19295;19297;19298;19301;19300,"..
    "%19184;19387;19388;19389;19390,19159;19160,19228;19232;19233;19234;19235,"..
    "%19239;19245,19255;19256;19257;19258;19259,19263,"..
    "%19376;19377,19290;19294;24283,!19286;19287,"..
    "!19370;19371;19373,e19306,"..
    "'19168;19180;19181;24296;24297,"..
    "&c19386",
		DRUID = --bal
    '16814;16815;16816;16817;16818,16689,a17245;17247;17248;17249,'..
    '%16918;16919;16920,16821;16822;16823;16824;16825,16902;16903;16904;16905;16906,16833;16834;16835,'..
    '16836;16839;16840,!c16864,16819;16820,'..
    '!f16909;16910;16911;16912;16913,16850;16923;16924;16925;16926,'..
    '&16880,16845;16846;16847,'..
    '&b16896;16897;16899;16900;16901,'..
    '&24858|'..
    --feral
    '!16934;16935;16936;16937;16938,16858;16859;16860;16861;16862,'..
    '%16947;16948;16949;16950;16951,16940;16941,16929;16930;16931;16932;16933,'..
    '%17002;24866,16979,16942;16943;16944,'..
    '%16966;16968,16972;16974;16975,c16952;16954,d16958;16961,'..
    '16998;16999,!16857,'..
    '&e17003;17004;17005;17006;24894,'..
    '&17007|'..
    --resto
    '!17050;17051;17053;17054;17055,17056;17058;17059;17060;17061,'..
    '%17069;17070;17071;17072;17073,17063;17065;17066;17067;17068,17079;17082,'..
    '&17106;17107;17108,5570,17118;17119;17120;17121;17122,'..
    '!24968;24969;24970;24971;24972,!17111;17112;17113,'..
    'h17116,!e17104;24943;24944;24945;24946,17123;17124,'..
    '"17074;17075;17076;17077;17078,'..
    '&f18562',
		SHAMAN = --Elemental
    "!16039;16109;16110;16111;16112,16035;16105;16106;16107;16108,"..
    "%16043;16130,28996;28997;28998,16038;16160;16161,"..
    "%16164,16040;16113;16114;16115;16116,16041;16117;16118;16119;16120,"..
    "%16086;16544,29062;29064;29065,!30160;29179;29180,"..
    "28999;29000,16089,"..
    "'f16578;16579;16580;16581;16582,"..
    "&b16166|"..
    --enh
    "!17485;17486;17487;17488;17489,16253;16298;16299;16300;16301,"..
    "%16258;16293,16255;16302;16303;16304;16305,16262;16287,16261;16290;16291,"..
    "16259;16295,!16269,16254;16271;16272;16273;16274,"..
    "!f16256;16281;16282;16283;16284,16252;16306;16307;16308;16309,"..
    "%29192;29193,16266;29079;29080,16268,"..
    "'29082;29084;29086;29087;29088,"..
    "&c17364|"..
    --resto
    "!16182;16226;16227;16228;16229,16179;16214;16215;16216;16217,"..
    "%16184;16209,16176;16235;16240,16173;16222;16223;16224;16225,"..
    "%16180;16196;16198,16181;16230;16232;16233;16234,16189,29187;29189;29191,"..
    "!16187;16205;16206;16207;16208,16194;16218;16219;16220;16221,"..
    "%29206;29205;29202,!16188,"..
    "'16178;16210;16211;16212;16213,"..
    "&e16190",
		PALADIN = --holy
    "!20262;20263;20264;20265;20266,20257;20258;20259;20260;20261,"..
    "&20205;20206;20207;20209;20208,20224;20225;20330;20331;20332,"..
    "%20237;20238;20239,26573,20234;20235,9453;25836,"..
    "!20210;20212;20213;20214;20215,20244;20245,"..
    "&b20216,20359;20360;20361,"..
    "'5923;5924;5925;5926;25829,"..
    "&c20473|"..
    --prot
    "!20138;20139;20140;20141;20142,20127;20130;20135;20136;20137,"..
    "%20189;20192;20193,20174;20175,!20143;20144;20145;20146;20147,"..
    "20217,20468;20469;20470,f20148;20149;20150,20096;20097;20098;20099;20100,"..
    "!20487;20488;20489,20254;20255;20256,"..
    "&20911,20177;20179;20181;20180;20182,"..
    "'20196;20197;20198;20199;20200,"..
    "&c20925|"..
    --Ret 
    "!20042;20045;20046;20047;20048,20101;20102;20103;20104;20105,"..
    "%25956;25957,20335;20336;20337,20060;20061;20062;20063;20064,"..
    "%9452;26016;26021,20117;20118;20119;20120;20121,20375,26022;26023,"..
    "9799;25988,!20091;20092,"..
    "%20111;20112;20113,!20218,"..
    "&g20049;20056;20057;20058;20059,"..
    "&20066",
    Bat = {deep_copy(AllPets)},
    Bear = {deep_copy(AllPets)},
    Boar = {deep_copy(AllPets)},
    Cat = {deep_copy(AllPets)},
    Crab = {deep_copy(AllPets)},
    Crocolisk = {deep_copy(AllPets)},
    Gorilla = {deep_copy(AllPets)},
    Hyena = {deep_copy(AllPets)},
    Raptor = {deep_copy(AllPets)},
    Scorpid = {deep_copy(AllPets)},
    Spider = {deep_copy(AllPets)},
    Tallstrider = {deep_copy(AllPets)},
    Turtle = {deep_copy(AllPets)},
    Wolf = {deep_copy(AllPets)},
    ["Bird of Prey"] = {deep_copy(AllPets)},
    ["Carrion Bird"] = {deep_copy(AllPets)},
    ["Wind Serpent"] = {deep_copy(AllPets)},
    --Tenacity = '61682;61683,61685,61686;61687;61688,61689;61690,53182;53183;53184,19596,d53481;53482,d53175;53176,61680;61681;52858,53178;53179,53409;53411,63900,"53450;53451,53427;53429;53430,53478,f53477,d53480,53476,!62764;62765,c62758;62762',
		--Cunning = '61682;61683,61684,*23145,61686;61687;61688,61689;61690,19596,e53483;53485,*e53554;53555,53514;53516,53182;53183;53184,61680;61681;52858,53409;53411,54044,&53427;53429;53430,52234;53497,f53511;53512,53508,53517,d53490,53450;53451,d62758;62762,"b53480',
    --Ferocity = "61682;61683,61684,*23145,61686;61687;61688,61689;61690,53180;53181,53186;53187,53182;53183;53184,19596,61680;61681;52858,!53409;53411,61685,*52825,!g55709,53203;53204;53205,53427;53429;53430,53401,d53426,d53434,%62759;62760,!b62758;62762",
	}
  
  spelldata.Bat[1][2] = FamilySkills[2]
  spelldata.Bat[1][12] = FamilySkills[12]
  spelldata.Bat[1][13] = FamilySkills[13]
  spelldata.Bear[1][2] = FamilySkills[2]
  spelldata.Bear[1][3] = FamilySkills[3]
  spelldata.Boar[1][2] = FamilySkills[2]
  spelldata.Boar[1][6] = FamilySkills[6]
  spelldata.Boar[1][14] = FamilySkills[14]
  spelldata.Cat[1][2] = FamilySkills[2]
  spelldata.Cat[1][3] = FamilySkills[3]
  spelldata.Cat[1][6] = FamilySkills[6]
  spelldata.Cat[1][15] = FamilySkills[15]
  spelldata.Crab[1][3] = FamilySkills[3]
  spelldata.Crocolisk[1][2] = FamilySkills[2]
  spelldata.Gorilla[1][2] = FamilySkills[2]
  spelldata.Gorilla[1][16] = FamilySkills[16]
  spelldata.Hyena[1][2] = FamilySkills[2]
  spelldata.Hyena[1][6] = FamilySkills[6]
  spelldata.Raptor[1][2] = FamilySkills[2]
  spelldata.Raptor[1][3] = FamilySkills[3]
  spelldata.Scorpid[1][3] = FamilySkills[3]
  spelldata.Scorpid[1][17] = FamilySkills[17]
  spelldata.Spider[1][2] = FamilySkills[2]
  spelldata.Tallstrider[1][2] = FamilySkills[2]
  spelldata.Tallstrider[1][6] = FamilySkills[6]
  spelldata.Turtle[1][2] = FamilySkills[2]
  spelldata.Turtle[1][18] = FamilySkills[18]
  spelldata.Wolf[1][2] = FamilySkills[2]
  spelldata.Wolf[1][6] = FamilySkills[6]
  spelldata.Wolf[1][20] = FamilySkills[20]
  spelldata["Bird of Prey"][1][3] = FamilySkills[3]
  spelldata["Bird of Prey"][1][12] = FamilySkills[12]
  spelldata["Bird of Prey"][1][13] = FamilySkills[13]
  spelldata["Carrion Bird"][1][2] = FamilySkills[2]
  spelldata["Carrion Bird"][1][3] = FamilySkills[3]
  spelldata["Carrion Bird"][1][12] = FamilySkills[12]
  spelldata["Carrion Bird"][1][13] = FamilySkills[13]
  spelldata["Wind Serpent"][1][2] = FamilySkills[2]
  spelldata["Wind Serpent"][1][12] = FamilySkills[12]
  spelldata["Wind Serpent"][1][19] = FamilySkills[19]

	Talented.spelldata = spelldata
end

-------------------------------------------------------------------------------
-- tabdata.lua
--

-- Generated Data, do not modify
do
	local tabdata = {
		WARRIOR = {
			{background = "WarriorArms"},
			{background = "WarriorFury"},
			{background = "WarriorProtection"}
		},
		ROGUE = {
			{background = "RogueAssassination"},
			{background = "RogueCombat"},
			{background = "RogueSubtlety"}
		},
		MAGE = {
			{background = "MageArcane"},
			{background = "MageFire"},
			{background = "MageFrost"}
		},
		PRIEST = {
			{background = "PriestDiscipline"},
			{background = "PriestHoly"},
			{background = "PriestShadow"}
		},
		WARLOCK = {
			{background = "WarlockCurses"},
			{background = "WarlockSummoning"},
			{background = "WarlockDestruction"}
		},
		HUNTER = {
			{background = "HunterBeastMastery"},
			{background = "HunterMarksmanship"},
			{background = "HunterSurvival"}
		},
		DRUID = {
			{background = "DruidBalance"},
			{background = "DruidFeralCombat"},
			{background = "DruidRestoration"}
		},
		SHAMAN = {
			{background = "ShamanElementalCombat"},
			{background = "ShamanEnhancement"},
			{background = "ShamanRestoration"}
		},
		PALADIN = {
			{background = "PaladinHoly"},
			{background = "PaladinProtection"},
			{background = "PaladinCombat"}
		},
		["Bird of Prey"] = {{background = "HunterPetCunning"}},
		Spider = {{background = "HunterPetCunning"}},
		Bat = {{background = "HunterPetCunning"}},
		["Wind Serpent"] = {{background = "HunterPetCunning"}},
		
    Bear = {{background = "HunterPetTenacity"}},
    Boar = {{background = "HunterPetTenacity"}},
    Crab = {{background = "HunterPetTenacity"}},
    Crocolisk = {{background = "HunterPetTenacity"}},
    Gorilla = {{background = "HunterPetTenacity"}},
    Scorpid = {{background = "HunterPetTenacity"}},
    Turtle = {{background = "HunterPetTenacity"}},
    
		["Carrion Bird"] = {{background = "HunterPetFerocity"}},
    Cat = {{background = "HunterPetFerocity"}},
    Hyena = {{background = "HunterPetFerocity"}},
    Raptor = {{background = "HunterPetFerocity"}},
    Tallstrider = {{background = "HunterPetFerocity"}},
    Wolf = {{background = "HunterPetFerocity"}}
	}
	local locale = GetLocale()
	if locale == "esES" then
		tabdata.WARRIOR[1].name = "Armas"
		tabdata.WARRIOR[2].name = "Furia"
		tabdata.WARRIOR[3].name = "Protección"
		tabdata.ROGUE[1].name = "Asesinato"
		tabdata.ROGUE[2].name = "Combate"
		tabdata.ROGUE[3].name = "Sutileza"
		tabdata.MAGE[1].name = "Arcano"
		tabdata.MAGE[2].name = "Fuego"
		tabdata.MAGE[3].name = "Escarcha"
		tabdata.PRIEST[1].name = "Disciplina"
		tabdata.PRIEST[2].name = "Sagrado"
		tabdata.PRIEST[3].name = "Sombras"
		tabdata.WARLOCK[1].name = "Aflicción"
		tabdata.WARLOCK[2].name = "Demonología"
		tabdata.WARLOCK[3].name = "Destrucción"
		tabdata.HUNTER[1].name = "Dominio de bestias"
		tabdata.HUNTER[2].name = "Puntería"
		tabdata.HUNTER[3].name = "Supervivencia"
		tabdata.DRUID[1].name = "Equilibrio"
		tabdata.DRUID[2].name = "Combate feral"
		tabdata.DRUID[3].name = "Restauración"
		tabdata.SHAMAN[1].name = "Elemental"
		tabdata.SHAMAN[2].name = "Mejora"
		tabdata.SHAMAN[3].name = "Restauración"
		tabdata.PALADIN[1].name = "Sagrado"
		tabdata.PALADIN[2].name = "Protección"
		tabdata.PALADIN[3].name = "Reprensión"
		--tabdata.Cunning[1].name = "Astucia"
		--tabdata.Tenacity[1].name = "Tenacidad"
		--tabdata.Ferocity[1].name = "Ferocidad"
	elseif locale == "zhCN" then
		tabdata.WARRIOR[1].name = "武器"
		tabdata.WARRIOR[2].name = "狂怒"
		tabdata.WARRIOR[3].name = "防护"
		tabdata.ROGUE[1].name = "刺杀"
		tabdata.ROGUE[2].name = "战斗"
		tabdata.ROGUE[3].name = "敏锐"
		tabdata.MAGE[1].name = "奥术"
		tabdata.MAGE[2].name = "火焰"
		tabdata.MAGE[3].name = "冰霜"
		tabdata.PRIEST[1].name = "戒律"
		tabdata.PRIEST[2].name = "神圣"
		tabdata.PRIEST[3].name = "暗影"
		tabdata.WARLOCK[1].name = "痛苦"
		tabdata.WARLOCK[2].name = "恶魔学识"
		tabdata.WARLOCK[3].name = "毁灭"
		tabdata.HUNTER[1].name = "野兽掌握"
		tabdata.HUNTER[2].name = "射击"
		tabdata.HUNTER[3].name = "生存"
		tabdata.DRUID[1].name = "平衡"
		tabdata.DRUID[2].name = "野性战斗"
		tabdata.DRUID[3].name = "恢复"
		tabdata.SHAMAN[1].name = "元素战斗"
		tabdata.SHAMAN[2].name = "增强"
		tabdata.SHAMAN[3].name = "恢复"
		tabdata.PALADIN[1].name = "神圣"
		tabdata.PALADIN[2].name = "防护"
		tabdata.PALADIN[3].name = "惩戒"
		--tabdata.Cunning[1].name = "灵巧"
		--tabdata.Tenacity[1].name = "坚毅"
		--tabdata.Ferocity[1].name = "凶暴"
	elseif locale == "frFR" then
		tabdata.WARRIOR[1].name = "Armes"
		tabdata.WARRIOR[2].name = "Fureur"
		tabdata.WARRIOR[3].name = "Protection"
		tabdata.ROGUE[1].name = "Assassinat"
		tabdata.ROGUE[2].name = "Combat"
		tabdata.ROGUE[3].name = "Finesse"
		tabdata.MAGE[1].name = "Arcanes"
		tabdata.MAGE[2].name = "Feu"
		tabdata.MAGE[3].name = "Givre"
		tabdata.PRIEST[1].name = "Discipline"
		tabdata.PRIEST[2].name = "Sacré"
		tabdata.PRIEST[3].name = "Ombre"
		tabdata.WARLOCK[1].name = "Affliction"
		tabdata.WARLOCK[2].name = "Démonologie"
		tabdata.WARLOCK[3].name = "Destruction"
		tabdata.HUNTER[1].name = "Maîtrise des bêtes"
		tabdata.HUNTER[2].name = "Précision"
		tabdata.HUNTER[3].name = "Survie"
		tabdata.DRUID[1].name = "Équilibre"
		tabdata.DRUID[2].name = "Combat farouche"
		tabdata.DRUID[3].name = "Restauration"
		tabdata.SHAMAN[1].name = "Élémentaire"
		tabdata.SHAMAN[2].name = "Amélioration"
		tabdata.SHAMAN[3].name = "Restauration"
		tabdata.PALADIN[1].name = "Sacré"
		tabdata.PALADIN[2].name = "Protection"
		tabdata.PALADIN[3].name = "Vindicte"
		--tabdata.Cunning[1].name = "Ruse"
		--tabdata.Tenacity[1].name = "Tenacité"
		--tabdata.Ferocity[1].name = "Férocité"
	elseif locale == "zhTW" then
		tabdata.WARRIOR[1].name = "武器"
		tabdata.WARRIOR[2].name = "狂怒"
		tabdata.WARRIOR[3].name = "防護"
		tabdata.ROGUE[1].name = "刺殺"
		tabdata.ROGUE[2].name = "戰鬥"
		tabdata.ROGUE[3].name = "敏銳"
		tabdata.MAGE[1].name = "秘法"
		tabdata.MAGE[2].name = "火焰"
		tabdata.MAGE[3].name = "冰霜"
		tabdata.PRIEST[1].name = "戒律"
		tabdata.PRIEST[2].name = "神聖"
		tabdata.PRIEST[3].name = "暗影"
		tabdata.WARLOCK[1].name = "痛苦"
		tabdata.WARLOCK[2].name = "惡魔"
		tabdata.WARLOCK[3].name = "毀滅"
		tabdata.HUNTER[1].name = "野獸控制"
		tabdata.HUNTER[2].name = "射擊"
		tabdata.HUNTER[3].name = "生存"
		tabdata.DRUID[1].name = "平衡"
		tabdata.DRUID[2].name = "野性戰鬥"
		tabdata.DRUID[3].name = "恢復"
		tabdata.SHAMAN[1].name = "元素"
		tabdata.SHAMAN[2].name = "增強"
		tabdata.SHAMAN[3].name = "恢復"
		tabdata.PALADIN[1].name = "神聖"
		tabdata.PALADIN[2].name = "防護"
		tabdata.PALADIN[3].name = "懲戒"
		--tabdata.Cunning[1].name = "靈巧"
		--tabdata.Tenacity[1].name = "堅毅"
		--tabdata.Ferocity[1].name = "兇暴"
	elseif locale == "deDE" then
		tabdata.WARRIOR[1].name = "Waffen"
		tabdata.WARRIOR[2].name = "Furor"
		tabdata.WARRIOR[3].name = "Schutz"
		tabdata.ROGUE[1].name = "Meucheln"
		tabdata.ROGUE[2].name = "Kampf"
		tabdata.ROGUE[3].name = "Täuschung"
		tabdata.MAGE[1].name = "Arkan"
		tabdata.MAGE[2].name = "Feuer"
		tabdata.MAGE[3].name = "Frost"
		tabdata.PRIEST[1].name = "Disziplin"
		tabdata.PRIEST[2].name = "Heilig"
		tabdata.PRIEST[3].name = "Schatten"
		tabdata.WARLOCK[1].name = "Gebrechen"
		tabdata.WARLOCK[2].name = "Dämonologie"
		tabdata.WARLOCK[3].name = "Zerstörung"
		tabdata.HUNTER[1].name = "Tierherrschaft"
		tabdata.HUNTER[2].name = "Treffsicherheit"
		tabdata.HUNTER[3].name = "Überleben"
		tabdata.DRUID[1].name = "Gleichgewicht"
		tabdata.DRUID[2].name = "Wilder Kampf"
		tabdata.DRUID[3].name = "Wiederherstellung"
		tabdata.SHAMAN[1].name = "Elementar"
		tabdata.SHAMAN[2].name = "Verstärkung"
		tabdata.SHAMAN[3].name = "Wiederherstellung"
		tabdata.PALADIN[1].name = "Heilig"
		tabdata.PALADIN[2].name = "Schutz"
		tabdata.PALADIN[3].name = "Vergeltung"
		--tabdata.Cunning[1].name = "Gerissenheit"
		--tabdata.Tenacity[1].name = "Hartnäckigkeit"
		--tabdata.Ferocity[1].name = "Wildheit"
	elseif locale == "ruRU" then
		tabdata.WARRIOR[1].name = "Оружие"
		tabdata.WARRIOR[2].name = "Неистовство"
		tabdata.WARRIOR[3].name = "Защита"
		tabdata.ROGUE[1].name = "Ликвидация"
		tabdata.ROGUE[2].name = "Бой"
		tabdata.ROGUE[3].name = "Скрытность"
		tabdata.MAGE[1].name = "Тайная магия"
		tabdata.MAGE[2].name = "Огонь"
		tabdata.MAGE[3].name = "Лед"
		tabdata.PRIEST[1].name = "Послушание"
		tabdata.PRIEST[2].name = "Свет"
		tabdata.PRIEST[3].name = "Темная магия"
		tabdata.WARLOCK[1].name = "Колдовство"
		tabdata.WARLOCK[2].name = "Демонология"
		tabdata.WARLOCK[3].name = "Разрушение"
		tabdata.HUNTER[1].name = "Чувство зверя"
		tabdata.HUNTER[2].name = "Стрельба"
		tabdata.HUNTER[3].name = "Выживание"
		tabdata.DRUID[1].name = "Баланс"
		tabdata.DRUID[2].name = "Сила зверя"
		tabdata.DRUID[3].name = "Исцеление"
		tabdata.SHAMAN[1].name = "Стихии"
		tabdata.SHAMAN[2].name = "Совершенствование"
		tabdata.SHAMAN[3].name = "Исцеление"
		tabdata.PALADIN[1].name = "Свет"
		tabdata.PALADIN[2].name = "Защита"
		tabdata.PALADIN[3].name = "Возмездие"
		--tabdata.Cunning[1].name = "Хитрость"
		--tabdata.Tenacity[1].name = "Упорство"
		--tabdata.Ferocity[1].name = "Свирепость"
	elseif locale == "koKR" then
		tabdata.WARRIOR[1].name = "무기"
		tabdata.WARRIOR[2].name = "분노"
		tabdata.WARRIOR[3].name = "방어"
		tabdata.ROGUE[1].name = "암살"
		tabdata.ROGUE[2].name = "전투"
		tabdata.ROGUE[3].name = "잠행"
		tabdata.MAGE[1].name = "비전"
		tabdata.MAGE[2].name = "화염"
		tabdata.MAGE[3].name = "냉기"
		tabdata.PRIEST[1].name = "수양"
		tabdata.PRIEST[2].name = "신성"
		tabdata.PRIEST[3].name = "암흑"
		tabdata.WARLOCK[1].name = "고통"
		tabdata.WARLOCK[2].name = "악마"
		tabdata.WARLOCK[3].name = "파괴"
		tabdata.HUNTER[1].name = "야수"
		tabdata.HUNTER[2].name = "사격"
		tabdata.HUNTER[3].name = "생존"
		tabdata.DRUID[1].name = "조화"
		tabdata.DRUID[2].name = "야성"
		tabdata.DRUID[3].name = "회복"
		tabdata.SHAMAN[1].name = "정기"
		tabdata.SHAMAN[2].name = "고양"
		tabdata.SHAMAN[3].name = "복원"
		tabdata.PALADIN[1].name = "신성"
		tabdata.PALADIN[2].name = "보호"
		tabdata.PALADIN[3].name = "징벌"
		--tabdata.Cunning[1].name = "교활"
		--tabdata.Tenacity[1].name = "끈기"
		--tabdata.Ferocity[1].name = "야성"
	else
		tabdata.WARRIOR[1].name = "Arms"
		tabdata.WARRIOR[2].name = "Fury"
		tabdata.WARRIOR[3].name = "Protection"
		tabdata.ROGUE[1].name = "Assassination"
		tabdata.ROGUE[2].name = "Combat"
		tabdata.ROGUE[3].name = "Subtlety"
		tabdata.MAGE[1].name = "Arcane"
		tabdata.MAGE[2].name = "Fire"
		tabdata.MAGE[3].name = "Frost"
		tabdata.PRIEST[1].name = "Discipline"
		tabdata.PRIEST[2].name = "Holy"
		tabdata.PRIEST[3].name = "Shadow"
		tabdata.WARLOCK[1].name = "Affliction"
		tabdata.WARLOCK[2].name = "Demonology"
		tabdata.WARLOCK[3].name = "Destruction"
		tabdata.HUNTER[1].name = "Beast Mastery"
		tabdata.HUNTER[2].name = "Marksmanship"
		tabdata.HUNTER[3].name = "Survival"
		tabdata.DRUID[1].name = "Balance"
		tabdata.DRUID[2].name = "Feral Combat"
		tabdata.DRUID[3].name = "Restoration"
		tabdata.SHAMAN[1].name = "Elemental"
		tabdata.SHAMAN[2].name = "Enhancement"
		tabdata.SHAMAN[3].name = "Restoration"
		tabdata.PALADIN[1].name = "Holy"
		tabdata.PALADIN[2].name = "Protection"
		tabdata.PALADIN[3].name = "Retribution"
    tabdata.Bat[1].name = "Bat"
    tabdata.Bear[1].name = "Bear"
    tabdata.Boar[1].name = "Boar"
    tabdata.Cat[1].name = "Cat"
    tabdata.Crab[1].name = "Crab"
    tabdata.Crocolisk[1].name = "Crocolisk"
    tabdata.Gorilla[1].name = "Gorilla"
    tabdata.Hyena[1].name = "Hyena"
    tabdata.Raptor[1].name = "Raptor"
    tabdata.Scorpid[1].name = "Scorpid"
    tabdata.Spider[1].name = "Spider"
    tabdata.Tallstrider[1].name = "Tallstrider"
    tabdata.Turtle[1].name = "Turtle"
    tabdata.Wolf[1].name = "Wolf"
    tabdata["Bird of Prey"][1].name  = "Bird of Prey"
    tabdata["Carrion Bird"][1].name = "Carrion Bird"
    tabdata["Wind Serpent"][1].name = "Wind Serpent"
		--tabdata.Cunning[1].name = "Cunning"
		--tabdata.Tenacity[1].name = "Tenacity"
		--tabdata.Ferocity[1].name = "Ferocity"
	end
	Talented.tabdata = tabdata
end
