friendGUIDrange = 10

b_intervals = {}
b_current_floor = {}
b_exhaust_change_floor = {}
b_exhaust_healing = {}
b_exhaust_aggresive = {}
b_exhaust_item = {}
b_possible_targets = {}
b_last_target_change = {}
b_last_attack = {}
b_ignored = {}
b_last_point = {}
b_current_route = {}
b_current_route_point = {}
b_current_route_direction = {}
b_running_away = {}
b_attackersLastSec = {}
b_names = {"Kshadowe","Geeme","Master Kellir","Home Simpson","Tomurka","Rei Leao","Paola Druidinha","Zeck Lester","Cadeirante Vitor","Bitche","Leaao Niice","Pally Pistao","Fryzon","Target Down","Vinagrete","Rapaz","Ned Stark","Lemysk Suisem","Taz Mania","Mancha Verde","Volna Dream","Castiel","Sir Druidizinho","Paladin Of Holy","Devil Oo Barbaro","Matheus De Mage","Sir Kolling","Matsumi","Glauber Henrique Xavier","Druidmaster","Lisa Simpson","Knight Of Badassdom","El'mago Valdivia","Senju Hashirama","Tankador","Rany Money","Refrigerante","Lek Metziro","Mokinho'ek","Tripowx","Archer","Old Impossible","Olico","Sooul","Optimus Primo","Menina Sapeca","Johnnie Walker","Thiagorib","Tetinha","Mandando Bolt","Largatixa Treze","Rush Na Taka","Meninosafadi","Druid Hell","Canabis","Parmax","Bodao","Surfando Na Paralize","Que Merda","Blocker Woe","Supino","Mage Pokado","Vingador","Avenger","Cabrunco Loko","Rapariga The Walking","Lucia Do Pagode","Proza Ruim","Loucade Acido","Carnage Of War","Aline Andrade","Dodiin","Brietta","Ethan","Queen Of Pain","Pure Hemp","Mulambosz","Maluko Rastafari","Druidax","El Shaarawy","Mybrute","Rei Leao Pala","Fabiinho'pelego","Cronus Knight","Aasdf","Qqwer","Devilwaree","Druid'walking","Paquita Do Capiroto","Diiana","Desttruiddor","Bruninh","Zero","Fika Rato","Sorcex","Manjador Dos Paranaue","Ligerinho'pm","Dona Benta","Shinigame","Diehan","Edu Darkeness","Bruh Darkness","Gordinn Ousado","Bucetinha Rosa","Mc Costetela","Richard Parker","Abcdefghijlmnopqrstuvxz","Victorzin","Rastaman","Following","Nerd'ziin","Mc Samuka","Pai De Santo","Cannabis","Mokinho","Miliviix","Oscar Garlic","Vigilante","Metade","Knight Bolado","Muito Loko Rapaiz","Fell Like Monster","Over Power","Slash","Cu De Grilo","Danyelzeraah Pally","Darkzeraah","Sir Madruga","Chupa","Ruxafas","Amigo Mokinho","Rafaelzinho Dashow Aboslut","Becker","Jarbinha","Matafacil","Thear Fared","Oloko'meu","Adolf Hitler","Depeche Mode","Kinho Jah Bless","Lord Paulistinha","Turtoise","Sirius Black","Xande","Legalize","Cadela Loka","Terrorista","Rasta","Thekinaishiri","Piceta Over","Orbital Gomao","Mestre Dos Magos","Jotape Sdmax","Cadeirante Estrabico","Priscila Pagodeira","Doglas'zin Psiu","Tecomi De Ladinho","Godky","Nasci Pra Morrer","Ze Loko","Johnny Bravo","Imperial Jah","Palla Delirious","Mokin Jr","Shiriahere","Derp Paladin Zuero","Flynawb","Pistao","Lulu","Pekeno","Maximilian'mongol","Kauane","Mageziin","Johnata Ekzor","Vai Toma No Cucaracha","Mercenario","Arzhak Mululu","Afiliado Do Devilware","Crystalina","Account Managier","Deadpoll","Pally Infernal","Yosemite Sam","Kaizem","Black Kniight","Toddy Nouxy","Matheus Walker","Jhoni Walker","Magnus Infernal","Mc Daleste","Eternal Sorx","Thor Paladin","Tonha Diaba","Eco Cachacero","Demon Holy","Palladina Linda","Forever","Favela Owns","Bruno Rusha'rp","Homer Simpsonp"}

b_stairs = {
{x=77,y=60,z=6},
{x=54,y=59,z=6},
{x = 52, y = 67, z = 6},
{x = 53, y = 67, z = 6},
{x = 62, y = 66, z = 6},
{x = 57, y = 52, z = 6},
{x = 77, y = 60, z = 6},
{x = 81, y = 73, z = 6},
{x = 87, y = 69, z = 6},
{x = 94, y = 66, z = 6},
{x = 94, y = 83, z = 6},
{x = 106, y = 67, z = 6},
{x = 112, y = 77, z = 6},
{x = 117, y = 87, z = 6},
{x = 130, y = 65, z = 6},
{x = 129, y = 87, z = 6},
{x = 126, y = 99, z = 6},
{x = 148, y = 93, z = 6},
{x = 148, y = 89, z = 6},
{x = 156, y = 69, z = 6},
{x = 146, y = 72, z = 6},
{x = 146, y = 69, z = 6},
{x = 146, y = 66, z = 6},
{x = 134, y = 53, z = 6},
{x = 143, y = 53, z = 6},
{x = 146, y = 47, z = 6},
{x = 159, y = 58, z = 6},
{x = 162, y = 51, z = 6},
{x = 164, y = 60, z = 6},
{x = 134, y = 53, z = 6},
{x = 117, y = 51, z = 6},
{x = 114, y = 48, z = 6},
{x = 123, y = 51, z = 6},
{x = 125, y = 48, z = 6},
{x = 114, y = 48, z = 6},
{x = 85, y = 50, z = 6},
{x = 95, y = 39, z = 6},
{x = 157, y = 20, z = 6},
{x = 148, y = 21, z = 6},
{x = 118, y = 21, z = 6},
{x = 114, y = 22, z = 6},
{x = 102, y = 28, z = 6},
{x = 92, y = 28, z = 6},
{x = 36, y = 40, z = 6},
{x = 47, y = 40, z = 6},
{x = 41, y = 18, z = 6},
{x = 42, y = 18, z = 6},
{x = 116, y = 38, z = 6},
{x = 138, y = 105, z = 6},
{x = 146, y = 105, z = 6},
{x = 127, y = 106, z = 6},
{x = 127, y = 106, z = 6},
{x = 103, y = 107, z = 6},
{x = 99, y = 113, z = 6},
{x = 84, y = 102, z = 6},
{x = 80, y = 113, z = 6},
{x = 73, y = 111, z = 6},
{x = 71, y = 102, z = 6},
{x = 66, y = 122, z = 6},
{x = 76, y = 122, z = 6},
{x = 48, y = 123, z = 6},
{x = 54, y = 128, z = 6},
{x = 53, y = 107, z = 6},
{x = 26, y = 110, z = 6},
{x = 58, y = 85, z = 6},
{x = 58, y = 80, z = 6},
{x = 62, y = 66, z = 6},
{x = 46, y = 75, z = 6},
{x = 38, y = 79, z = 6},
{x = 40, y = 92, z = 6},
{x = 26, y = 110, z = 6},
{x = 11, y = 95, z = 6}
}

tmp_routes = {
{{x = 48, y = 67, z = 6},{x = 50, y = 67, z = 6}, {x = 52, y = 68, z = 6}},
{{x=77,y=60,z=6},{x=80,y=59,z=6}},
{{x=48,y=59,z=6},{x=51,y=59,z=6},{x=54,y=59,z=6}},
{{x=68,y=63,z=7},{x=72,y=62,z=7},{x=75,y=62,z=7},{x=76,y=60,z=7}},
{{x=17,y=108,z=7},{x=20,y=105,z=7},{x=26,y=104,z=7},{x=29,y=101,z=7},{x=31,y=98,z=7}},
{{x=12,y=99,z=7},{x=16,y=96,z=7},{x=21,y=96,z=7},{x=26,y=96,z=7},{x=32,y=97,z=7}},
{{x=30,y=117,z=7},{x=34,y=114,z=7},{x=32,y=109,z=7},{x=32,y=105,z=7},{x=32,y=100,z=7}},
{{x=49,y=130,z=7},{x=45,y=126,z=7},{x=42,y=122,z=7},{x=40,y=117,z=7},{x=37,y=114,z=7},{x=35,y=110,z=7},{x=33,y=105,z=7},{x=33,y=100,z=7}},
{{x=40,y=123,z=7},{x=43,y=120,z=7},{x=43,y=115,z=7},{x=43,y=110,z=7},{x=43,y=105,z=7},{x=43,y=100,z=7},{x=38,y=98,z=7},{x=33,y=98,z=7}},
{{x=54,y=113,z=7},{x=54,y=107,z=7},{x=54,y=100,z=7},{x=58,y=97,z=7},{x=63,y=97,z=7},{x=65,y=96,z=7}},
{{x=33,y=96,z=7},{x=38,y=96,z=7},{x=43,y=95,z=7},{x=48,y=95,z=7},{x=53,y=95,z=7},{x=58,y=95,z=7},{x=63,y=96,z=7}},
{{x=33,y=94,z=7},{x=33,y=89,z=7},{x=33,y=84,z=7},{x=38,y=84,z=7},{x=44,y=86,z=7},{x=50,y=86,z=7},{x=54,y=89,z=7},{x=56,y=94,z=7},{x=61,y=95,z=7},{x=65,y=97,z=7}},
{{x=35,y=97,z=7},{x=40,y=95,z=7},{x=45,y=94,z=7},{x=50,y=94,z=7},{x=55,y=92,z=7},{x=55,y=86,z=7},{x=55,y=80,z=7},{x=54,y=74,z=7},{x=54,y=69,z=7},{x=57,y=65,z=7},{x=60,y=63,z=7}},
{{x=64,y=95,z=7},{x=60,y=94,z=7},{x=56,y=92,z=7},{x=53,y=88,z=7},{x=50,y=84,z=7},{x=50,y=80,z=7},{x=48,y=76,z=7}},
{{x=47,y=128,z=7},{x=45,y=123,z=7},{x=49,y=120,z=7},{x=54,y=120,z=7},{x=59,y=120,z=7},{x=63,y=118,z=7},{x=68,y=118,z=7}},
{{x=70,y=121,z=7},{x=70,y=117,z=7},{x=70,y=114,z=7},{x=69,y=110,z=7},{x=68,y=106,z=7},{x=67,y=101,z=7},{x=67,y=98,z=7},{x=67,y=96,z=7}},
{{x=66,y=98,z=7},{x=65,y=100,z=7},{x=65,y=104,z=7},{x=65,y=108,z=7},{x=65,y=112,z=7},{x=66,y=116,z=7},{x=63,y=120,z=7},{x=61,y=125,z=7},{x=57,y=128,z=7},{x=54,y=129,z=7}},
{{x=99,y=98,z=7},{x=96,y=102,z=7},{x=97,y=107,z=7},{x=100,y=110,z=7},{x=101,y=115,z=7},{x=96,y=116,z=7},{x=91,y=118,z=7},{x=86,y=118,z=7},{x=81,y=120,z=7},{x=76,y=119,z=7},{x=71,y=119,z=7}},
{{x=72,y=118,z=7},{x=77,y=117,z=7},{x=78,y=112,z=7},{x=81,y=109,z=7},{x=82,y=104,z=7},{x=82,y=99,z=7},{x=87,y=97,z=7},{x=92,y=97,z=7},{x=98,y=97,z=7}},
{{x=98,y=98,z=7},{x=95,y=102,z=7},{x=95,y=107,z=7},{x=90,y=108,z=7},{x=85,y=108,z=7},{x=80,y=108,z=7},{x=75,y=109,z=7},{x=71,y=112,z=7},{x=69,y=117,z=7},{x=96,y=92,z=7},{x=91,y=94,z=7},{x=86,y=95,z=7},{x=81,y=96,z=7},{x=76,y=96,z=7},{x=71,y=97,z=7}},
{{x=75,y=81,z=7},{x=74,y=86,z=7},{x=75,y=91,z=7},{x=75,y=96,z=7},{x=70,y=96,z=7},{x=67,y=97,z=7}},
{{x=69,y=98,z=7},{x=74,y=97,z=7},{x=79,y=97,z=7},{x=84,y=95,z=7},{x=85,y=90,z=7},{x=86,y=85,z=7},{x=91,y=84,z=7},{x=92,y=79,z=7},{x=95,y=75,z=7},{x=99,y=75,z=7}},
{{x=99,y=63,z=7},{x=98,y=68,z=7},{x=98,y=73,z=7},{x=98,y=76,z=7}},
{{x=98,y=63,z=7},{x=93,y=64,z=7},{x=89,y=67,z=7},{x=89,y=72,z=7},{x=88,y=75,z=7}},
{{x=106,y=70,z=7},{x=107,y=66,z=7},{x=104,y=63,z=7},{x=99,y=62,z=7}},
{{x=102,y=93,z=7},{x=107,y=92,z=7},{x=112,y=91,z=7},{x=112,y=86,z=7},{x=107,y=84,z=7},{x=106,y=83,z=7}},
{{x=101,y=97,z=7},{x=106,y=97,z=7},{x=111,y=97,z=7},{x=115,y=97,z=7},{x=119,y=94,z=7},{x=120,y=89,z=7},{x=120,y=84,z=7},{x=119,y=79,z=7},{x=116,y=78,z=7},{x=118,y=73,z=7},{x=116,y=68,z=7},{x=113,y=64,z=7},{x=108,y=64,z=7},{x=103,y=64,z=7},{x=100,y=60,z=7}},
{{x=100,y=98,z=7},{x=100,y=103,z=7},{x=104,y=103,z=7},{x=109,y=102,z=7},{x=113,y=102,z=7},{x=116,y=106,z=7},{x=114,y=114,z=7},{x=108,y=115,z=7},{x=104,y=114,z=7},{x=104,y=107,z=7}},
{{x=153,y=103,z=7},{x=148,y=102,z=7},{x=142,y=102,z=7},{x=137,y=102,z=7},{x=132,y=102,z=7},{x=127,y=101,z=7},{x=122,y=100,z=7},{x=117,y=99,z=7},{x=112,y=99,z=7},{x=107,y=99,z=7},{x=102,y=99,z=7}},
{{x=138,y=85,z=7},{x=135,y=89,z=7},{x=134,y=94,z=7},{x=133,y=99,z=7},{x=129,y=102,z=7},{x=124,y=101,z=7},{x=119,y=99,z=7},{x=114,y=97,z=7},{x=109,y=97,z=7},{x=103,y=97,z=7}},
{{x=139,y=86,z=7},{x=141,y=91,z=7},{x=144,y=93,z=7},{x=144,y=98,z=7},{x=147,y=102,z=7},{x=152,y=103,z=7}},
{{x=152,y=67,z=7},{x=149,y=72,z=7},{x=146,y=76,z=7},{x=141,y=78,z=7},{x=138,y=82,z=7}},
{{x=126,y=73,z=7},{x=119,y=74,z=7},{x=118,y=70,z=7},{x=118,y=67,z=7},{x=117,y=63,z=7}},
{{x=153,y=60,z=7},{x=148,y=60,z=7},{x=142,y=60,z=7},{x=137,y=60,z=7},{x=132,y=60,z=7},{x=127,y=60,z=7},{x=122,y=60,z=7},{x=117,y=61,z=7},{x=112,y=61,z=7},{x=107,y=61,z=7},{x=102,y=61,z=7},{x=98,y=60,z=7}},
{{x=120,y=72,z=7},{x=121,y=67,z=7},{x=125,y=65,z=7},{x=129,y=62,z=7},{x=135,y=62,z=7},{x=140,y=62,z=7},{x=145,y=62,z=7},{x=150,y=62,z=7},{x=153,y=64,z=7}},
{{x=155,y=102,z=7},{x=155,y=97,z=7},{x=155,y=92,z=7},{x=155,y=87,z=7},{x=155,y=82,z=7},{x=155,y=77,z=7},{x=154,y=72,z=7},{x=154,y=66,z=7},{x=154,y=61,z=7}},
{{x=151,y=66,z=7},{x=151,y=71,z=7},{x=151,y=76,z=7},{x=152,y=81,z=7},{x=152,y=86,z=7},{x=152,y=91,z=7},{x=152,y=96,z=7},{x=154,y=101,z=7},{x=152,y=106,z=7}},
{{x=67,y=63,z=7},{x=68,y=68,z=7},{x=66,y=73,z=7},{x=61,y=74,z=7},{x=56,y=74,z=7},{x=56,y=79,z=7},{x=56,y=84,z=7},{x=56,y=89,z=7},{x=57,y=94,z=7},{x=62,y=95,z=7},{x=66,y=97,z=7}},
{{x=66,y=64,z=7},{x=66,y=69,z=7},{x=66,y=74,z=7},{x=66,y=79,z=7},{x=66,y=84,z=7},{x=66,y=89,z=7},{x=66,y=94,z=7},{x=68,y=97,z=7}},
{{x=59,y=86,z=7},{x=61,y=90,z=7},{x=64,y=91,z=7},{x=65,y=94,z=7},{x=68,y=96,z=7}},
{{x=55,y=58,z=7},{x=58,y=61,z=7},{x=62,y=61,z=7},{x=65,y=61,z=7},{x=69,y=61,z=7}},
{{x=69,y=63,z=7},{x=74,y=63,z=7},{x=79,y=62,z=7},{x=84,y=62,z=7},{x=89,y=62,z=7},{x=94,y=62,z=7},{x=98,y=62,z=7}},
{{x=97,y=60,z=7},{x=92,y=60,z=7},{x=87,y=60,z=7},{x=82,y=61,z=7},{x=77,y=61,z=7},{x=72,y=62,z=7}},
{{x=55,y=63,z=7},{x=56,y=68,z=7},{x=58,y=73,z=7},{x=63,y=74,z=7},{x=64,y=79,z=7},{x=65,y=84,z=7},{x=65,y=89,z=7},{x=67,y=93,z=7},{x=65,y=98,z=7}},
{{x=134,y=62,z=7},{x=135,y=65,z=7},{x=135,y=68,z=7},{x=138,y=67,z=7},{x=137,y=65,z=7}},
{{x=63,y=61,z=7},{x=63,y=55,z=7},{x=64,y=50,z=7},{x=63,y=44,z=7},{x=61,y=38,z=7},{x=56,y=37,z=7},{x=51,y=36,z=7},{x=44,y=35,z=7},{x=41,y=37,z=7}},
{{x=44,y=19,z=7},{x=45,y=22,z=7},{x=45,y=26,z=7},{x=42,y=30,z=7},{x=41,y=33,z=7},{x=42,y=36,z=7}},
{{x=39,y=19,z=7},{x=37,y=21,z=7},{x=38,y=25,z=7},{x=41,y=29,z=7},{x=42,y=33,z=7},{x=42,y=37,z=7}},
{{x=29,y=30,z=7},{x=33,y=33,z=7},{x=36,y=34,z=7},{x=40,y=37,z=7}},
{{x=29,y=37,z=7},{x=33,y=36,z=7},{x=36,y=36,z=7},{x=37,y=36,z=7}},
{{x=44,y=37,z=7},{x=48,y=36,z=7},{x=54,y=36,z=7},{x=61,y=36,z=7},{x=66,y=34,z=7},{x=65,y=29,z=7},{x=67,y=35,z=7}},
{{x=78,y=30,z=7},{x=73,y=31,z=7},{x=68,y=33,z=7},{x=64,y=36,z=7}},
{{x=43,y=36,z=7},{x=48,y=35,z=7},{x=52,y=35,z=7},{x=58,y=36,z=7},{x=66,y=36,z=7},{x=72,y=35,z=7},{x=76,y=35,z=7},{x=80,y=35,z=7},{x=84,y=35,z=7},{x=88,y=35,z=7},{x=93,y=36,z=7},{x=98,y=37,z=7}},
{{x=65,y=61,z=7},{x=68,y=56,z=7},{x=70,y=51,z=7},{x=75,y=49,z=7},{x=80,y=48,z=7},{x=86,y=47,z=7},{x=91,y=46,z=7},{x=96,y=45,z=7},{x=98,y=42,z=7},{x=99,y=37,z=7}},
{{x=126,y=30,z=7},{x=121,y=31,z=7},{x=116,y=31,z=7},{x=110,y=31,z=7},{x=103,y=30,z=7},{x=98,y=31,z=7},{x=100,y=36,z=7}},
{{x=96,y=36,z=7},{x=91,y=37,z=7},{x=87,y=39,z=7},{x=87,y=44,z=7},{x=83,y=48,z=7},{x=76,y=48,z=7},{x=70,y=48,z=7},{x=67,y=45,z=7},{x=65,y=40,z=7},{x=63,y=39,z=7}},
{{x=100,y=38,z=7},{x=100,y=44,z=7},{x=100,y=47,z=7},{x=100,y=52,z=7},{x=100,y=56,z=7},{x=100,y=61,z=7}},
{{x=97,y=61,z=7},{x=97,y=55,z=7},{x=97,y=51,z=7},{x=97,y=47,z=7},{x=98,y=43,z=7},{x=98,y=39,z=7}},
{{x=117,y=65,z=7},{x=110,y=62,z=7},{x=108,y=58,z=7},{x=105,y=55,z=7},{x=102,y=52,z=7},{x=101,y=49,z=7},{x=101,y=44,z=7},{x=100,y=41,z=7}},
{{x=110,y=33,z=7},{x=110,y=39,z=7},{x=111,y=44,z=7},{x=111,y=49,z=7},{x=112,y=53,z=7},{x=112,y=57,z=7},{x=115,y=62,z=7}},
{{x=128,y=30,z=7},{x=133,y=30,z=7},{x=138,y=30,z=7},{x=143,y=31,z=7},{x=147,y=31,z=7},{x=152,y=31,z=7},{x=154,y=36,z=7},{x=154,y=41,z=7},{x=154,y=45,z=7},{x=155,y=49,z=7},{x=154,y=53,z=7},{x=154,y=57,z=7},{x=153,y=60,z=7}},
{{x=150,y=62,z=7},{x=145,y=61,z=7},{x=140,y=59,z=7},{x=136,y=59,z=7},{x=131,y=60,z=7},{x=127,y=60,z=7},{x=121,y=61,z=7}},
{{x=119,y=33,z=7},{x=122,y=36,z=7},{x=126,y=40,z=7},{x=127,y=45,z=7},{x=127,y=51,z=7},{x=128,y=54,z=7},{x=130,y=59,z=7}},
{{x=130,y=29,z=7},{x=135,y=31,z=7},{x=136,y=36,z=7},{x=141,y=40,z=7},{x=146,y=43,z=7},{x=151,y=44,z=7},{x=156,y=51,z=7}},
{{x=155,y=32,z=7},{x=154,y=40,z=7},{x=150,y=43,z=7},{x=145,y=44,z=7},{x=142,y=47,z=7},{x=136,y=47,z=7},{x=130,y=47,z=7},{x=124,y=45,z=7},{x=118,y=45,z=7},{x=112,y=48,z=7},{x=112,y=51,z=7},{x=110,y=55,z=7},{x=109,y=60,z=7},{x=104,y=61,z=7}},
{{x=130,y=31,z=7},{x=135,y=29,z=7},{x=141,y=28,z=7},{x=144,y=22,z=7},{x=143,y=18,z=7}},
{{x=160,y=19,z=7},{x=158,y=24,z=7},{x=156,y=28,z=7},{x=151,y=30,z=7},{x=145,y=29,z=7},{x=138,y=29,z=7}},
{{x=33,y=40,z=7},{x=35,y=36,z=7},{x=40,y=35,z=7}},
{{x=45,y=35,z=7},{x=49,y=36,z=7},{x=56,y=36,z=7},{x=63,y=37,z=7},{x=66,y=38,z=7}},
{{x=56,y=52,z=7},{x=60,y=50,z=7},{x=65,y=54,z=7},{x=65,y=57,z=7},{x=69,y=62,z=7}}
}
for _, pos in pairs(b_stairs) do
	table.insert(tmp_routes, {pos})
end
b_points = {}
b_routes = {}
for routeID, routePoints in pairs(tmp_routes) do
	table.insert(b_routes, {})
	for _, point in pairs(routePoints) do
		table.insert(b_points, point)
		table.insert(b_routes[routeID], #b_points)
	end
end
b_points_routes = {}
for routeID, routePoints in pairs(b_routes) do
	for _, pointID in pairs(routePoints) do
		b_points_routes[pointID] = routeID
	end
end

function setCurrentRoute(guid, newRoute)
	b_current_route[guid] = newRoute
end

function getCurrentRoute(guid) -- return number
	if(b_current_route[guid] == nil) then
		return 1
	else
		return b_current_route[guid]
	end
end

function setCurrentRoutePoint(guid, newRoutePoint)
	b_current_route_point[guid] = newRoutePoint
end

function getCurrentRoutePoint(guid) -- return number
	if(b_current_route_point[guid] == nil) then
		return 1
	else
		return b_current_route_point[guid]
	end
end

function setCurrentRouteDirection(guid, newRouteDirection)
	b_current_route_direction[guid] = newRouteDirection
end

function getCurrentRouteDirection(guid) -- return number
	if(b_current_route_direction[guid] == nil) then
		return 1
	else
		return b_current_route_direction[guid]
	end
end

function chooseClosestRoute(pos, cid, guid)
	--print('szuka ' .. guid)
	local closePositions = {}
	local closePositionsSameRoute = {}
	local dist = 0
	for pointID, pointPos in pairs(b_points) do
		dist = getDistanceBetween(pos, pointPos)
		if(dist < 10) then
			if(b_points_routes[pointID] ~= getCurrentRoute(guid)) then
				table.insert(closePositions, pointID)
			else
				table.insert(closePositionsSameRoute, pointID)
			end
		end
	end
	local pointID = 0
	local b_rand = 0
	while(#closePositions > 0) do
		b_rand = math.random(1, #closePositions)
		pointID = closePositions[b_rand]
		if(canGoTo(cid, b_points[pointID], 0, 1, 1, 1, 12)) then
			setCurrentRoute(guid, b_points_routes[pointID])
			local pointOfRoute = 1
			for routePointID, routePoint in pairs(b_routes[b_points_routes[pointID]]) do
				if(routePoint == pointID) then
					pointOfRoute = routePointID
					break
				end
			end
			setCurrentRoutePoint(guid, pointOfRoute)
			if(pointOfRoute >= #b_routes[b_points_routes[pointID]] / 2) then
				setCurrentRouteDirection(guid, -1)
			else
				setCurrentRouteDirection(guid, 1)
			end
			return pointID
		end
		table.remove(closePositions, b_rand)
	end

	if(canGoTo(cid, b_points[b_routes[getCurrentRoute(guid)][getCurrentRoutePoint(guid)]], 0, 1, 1, 1, 12)) then
		if(getCurrentRouteDirection(guid) == 1) then
			setCurrentRouteDirection(guid, -1)
		else
			setCurrentRouteDirection(guid, 1)
		end
		return b_points[b_routes[getCurrentRoute(guid)][getCurrentRoutePoint(guid)]]
	end

	return 0
end

function reachDestinationPoint(guid, pos)
	local walkToPos = b_points[b_routes[getCurrentRoute(guid)][getCurrentRoutePoint(guid)]]
	return (getDistanceBetween(walkToPos, pos) <= 1)
end

function updateInterval(guid)
	if(b_intervals[guid] == nil) then
		b_intervals[guid] = -1
	end
	b_intervals[guid] = b_intervals[guid] + 1
end

function checkInterval(guid, num)
	return (b_intervals[guid] % num == 0)
end

function useHeal(cid, guid, manaCost, health, mana, text, anim, isHeal, isItem)
	if(health) then
		doCreatureAddHealth(cid, math.ceil(math.random(health[1], health[2])))
	end
	if(mana) then
		doCreatureAddMana(cid, math.ceil(math.random(mana[1], mana[2])))
	end

	doSendMagicEffect(getThingPos(cid), anim)
	doCreatureSay(cid, text, TALKTYPE_ORANGE_1)
	if(manaCost > 0) then
		doCreatureAddMana(cid, -manaCost, false)
	end
	if(isHeal) then
		setExhaustHealing(guid, 1000)
	end
	if(isItem) then
		setExhaustItem(guid, 1000)
	end
end

function useBestHealing(cid, guid)
	local exItem = isExhaustItem(guid)
	local exHeal = isExhaustHealing(guid)
	local level = getPlayerLevel(cid)
	local voc = getPlayerVocation(cid)
	if(voc == 1 or voc == 2) then
		if(getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 90) then
			if(not exHeal and math.random(1,2) == 1 and getCreatureMana(cid) > 160) then
				-- exura vita
				useHeal(cid, guid, 160, {150,300}, nil, "exura vita", CONST_ME_MAGIC_BLUE, true, false)
			elseif(not exItem) then
				-- health potion
				useHeal(cid, guid, 0, {100,200}, nil, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
			end
		elseif(not exItem and (getCreatureMaxMana(cid) - getCreatureMana(cid) > 850 or (getCreatureMaxMana(cid) - getCreatureMana(cid) > 50 and math.random(1,4) == 2))) then
			if(level >= 80) then
				-- great mana potion
				useHeal(cid, guid, 0, nil, {200,300}, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
			else
				-- strong mana potion
				useHeal(cid, guid, 0, nil, {150,230}, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
			end
		end
	elseif(voc == 3) then
		if(not exItem and level > 80 and getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 250 and getCreatureMaxMana(cid) - getCreatureMana(cid) > 150) then
			-- great spirit potion
			useHeal(cid, guid, 0, {200,400}, {110,190}, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
		elseif(getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 50) then
			if(not exHeal and math.random(1,2) == 1 and getCreatureMana(cid) > 210) then
				-- exura san
				useHeal(cid, guid, 210, {450,600}, nil, "exura san", CONST_ME_MAGIC_BLUE, true, false)
			elseif(not exItem) then
				-- strong health potion
				useHeal(cid, guid, 0, {200,400}, nil, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
			end
		elseif(not exItem and getCreatureMaxMana(cid) - getCreatureMana(cid) > 150) then
			-- strong mana potion
			useHeal(cid, guid, 0, nil, {150,230}, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
		end
	elseif(voc == 4) then
		if(getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 250) then
			if(not exItem and level >= 130) then
				-- ultimate health potion
				useHeal(cid, guid, 0, {800,1000}, nil, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
			elseif(not exItem and level >= 80) then
				-- great health potion
				useHeal(cid, guid, 0, {500,700}, nil, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
			elseif(not exItem) then
				-- strong health potion
				useHeal(cid, guid, 0, {200,400}, nil, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
			end
		elseif(not exItem and getCreatureMaxMana(cid) - getCreatureMana(cid) > 150) then
			useHeal(cid, guid, 0, nil, {70,130}, "Aaaah...", CONST_ME_MAGIC_BLUE, false, true)
		end
	end
end

sudden_death = createCombatObject()
setCombatParam(sudden_death, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(sudden_death, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(sudden_death, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(sudden_death, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(sudden_death, COMBAT_FORMULA_LEVELMAGIC, -1, -60, -1, -60, 5, 5, 4, 7)



function castBestAttackingSpell(cid, guid)
	local ppos = getThingPosition(cid)
	local exItem = isExhaustItem(guid)
	local exAggr = isExhaustAggresive(guid)
	local level = getPlayerLevel(cid)
	local voc = getPlayerVocation(cid)
	local mana = getCreatureMana(cid)
	local targetCid = getCreatureTarget(cid)
	local targetPos = getThingPosition(targetCid)
	local target = numberToVariant(targetCid)
	if(voc == 1) then
		if(not exAggr and checkInterval(guid, 25 + guid % 13) and math.random(1, 5) == 1 and getCreatureMana(cid) - mana < 200) then
			local friends = 0
			local foes = 0
			for _, guyInRange in pairs(getSpectators(ppos, 5,5,false)) do
				if(isPlayer(guyInRange)) then
					if(isBot(guyInRange) and math.abs(getPlayerGUID(guyInRange) - guid) < friendGUIDrange) then
						friends = friends + 1
					else
						foes = foes + 1
					end
				end
			end
			if(friends < foes and friends < 3) then
				doCombat(cid, combatTS, target)
				doCreatureAddMana(cid, -650, false)
				setExhaustAggresive(guid, 2000)
				doCreatureSay(cid, "exevo gran mas vis", TALKTYPE_ORANGE_1)
			end
		end
		if(not exItem and not exAggr and getDistanceBetween(targetPos, ppos) <= 7 and isSightClear(targetPos, ppos, 1)) then
			doCombat(cid, sudden_death, target)
			setExhaustItem(guid, 1000)
			setExhaustAggresive(guid, 2000)
			setLastAttack(getPlayerGUID(cid), os.time())
		elseif(not exAggr and mana >= 20 and getDistanceBetween(targetPos, ppos) <= 6 and isSightClear(targetPos, ppos, 1)) then
			doCombat(cid, combatEMORT, target)
			doCreatureAddMana(cid, -20, false)
			setExhaustAggresive(guid, 2000)
			doCreatureSay(cid, "exori mort", TALKTYPE_ORANGE_1)
		end
	elseif(voc == 2) then
		if(not exItem and not exAggr and getDistanceBetween(targetPos, ppos) <= 7 and isSightClear(targetPos, ppos, 1)) then
			doCombat(cid, sudden_death, target)
			setExhaustItem(guid, 1000)
			setExhaustAggresive(guid, 2000)
			setLastAttack(getPlayerGUID(cid), os.time())
		elseif(not exAggr and mana >= 20 and getDistanceBetween(targetPos, ppos) <= 6 and isSightClear(targetPos, ppos, 1)) then
			doCombat(cid, combatETERRA, target)
			doCreatureAddMana(cid, -20, false)
			setExhaustAggresive(guid, 2000)
			doCreatureSay(cid, "exori tera", TALKTYPE_ORANGE_1)
		end
	elseif(voc == 3) then
		if(not exAggr and mana >= 25 and getDistanceBetween(targetPos, ppos) <= 6 and isSightClear(targetPos, ppos, 1)) then
			doCombat(cid, combatMELLETHROW, target)
			doCreatureAddMana(cid, -25, false)
			setExhaustAggresive(guid, 2000)
			doCreatureSay(cid, "exori con", TALKTYPE_ORANGE_1)
		end
	elseif(voc == 4) then
		if(not exAggr and mana >= 40 and getDistanceBetween(targetPos, ppos) <= 7 and isSightClear(targetPos, ppos, 1)) then
			doCombat(cid, combatMELLETHROW, target)
			doCreatureAddMana(cid, -40, false)
			setExhaustAggresive(guid, 2000)
			setLastAttack(getPlayerGUID(cid), os.time())
			doCreatureSay(cid, "exori hur", TALKTYPE_ORANGE_1)
		elseif(not exAggr and mana >= 340 and getDistanceBetween(targetPos, ppos) < 2) then
			doCombat(cid, combatFBER, target)
			doCreatureAddMana(cid, -340, false)
			setExhaustAggresive(guid, 2000)
			doCreatureSay(cid, "exori gran", TALKTYPE_ORANGE_1)
		elseif(not exAggr and mana >= 115 and getDistanceBetween(targetPos, ppos) < 2) then
			doCombat(cid, combatBER, target)
			doCreatureAddMana(cid, -115, false)
			setExhaustAggresive(guid, 2000)
			doCreatureSay(cid, "exori", TALKTYPE_ORANGE_1)
		end
	end
end

function setExhaustChangeFloor(guid, exhaust)
	b_exhaust_change_floor[guid] = getTime() + exhaust
end

function isExhaustChangeFloor(guid)
	return (b_exhaust_change_floor[guid] ~= nil and b_exhaust_change_floor[guid] > getTime())
end

function setExhaustHealing(guid, exhaust)
	b_exhaust_healing[guid] = getTime() + exhaust
end

function isExhaustHealing(guid)
	return (b_exhaust_healing[guid] ~= nil and b_exhaust_healing[guid] > getTime())
end

function setExhaustAggresive(guid, exhaust)
	b_exhaust_aggresive[guid] = getTime() + exhaust
end

function isExhaustAggresive(guid)
	return (b_exhaust_aggresive[guid] ~= nil and b_exhaust_aggresive[guid] > getTime())
end

function setExhaustItem(guid, exhaust)
	b_exhaust_item[guid] = getTime() + exhaust
end

function isExhaustItem(guid)
	return (b_exhaust_item[guid] ~= nil and b_exhaust_item[guid] > getTime())
end

function setCurrentFloor(guid, newCurrentFloor)
	b_current_floor[guid] = newCurrentFloor
end

function isCurrentFloor(guid, currentFloor)
	return (b_current_floor[guid] ~= nil and b_current_floor[guid] == currentFloor)
end

function getPossibleTargets(guid) -- return nil or table
	return b_possible_targets[guid]
end

function updatePossibleTargets(guid, pos)
	b_possible_targets[guid] = getSpectators(pos, 8, 6, false)
end

function setNewTarget(cid, guid, newTarget) -- return true/false
	if(doPlayerSetTarget(cid, newTarget)) then
		setLastAttack(guid, os.time())
		setLastTargetChange(guid, os.time())
		setPlayerModes(cid, 1,1,1)
		return true
	else
		return false
	end
end

function setLastAttack(guid, newTime)
	b_last_attack[guid] = newTime
end

function getLastAttack(guid) -- return number
	if(b_last_attack[guid] == nil) then
		return 0
	else
		return b_last_attack[guid]
	end
end

function setRunningAway(guid, value)
	b_running_away[guid] = os.time() + value
end

function isRunningAway(guid)
	if(b_running_away[guid] == nil) then
		return false
	else
		return b_running_away[guid] >= os.time()
	end
end

function setLastTargetChange(guid, newTime)
	b_last_target_change[guid] = newTime
end

function getLastTargetChange(guid) -- return number
	if(b_last_target_change[guid] == nil) then
		return 0
	else
		return b_last_target_change[guid]
	end
end



function isChangeTargetRequired(cid, guid)
	if(getCreatureTarget(cid) == 0) then
		return true
	elseif(os.time() - getLastTargetChange(guid) > 4 and os.time() - getLastAttack(guid) > 4) then -- jesli atakuje od 4 sekund i nie moze ranic
		addIgnored(guid, getCreatureTarget(cid), 12)
		return true
	elseif(getCreatureTarget(cid) > 0) then -- czy nie wali jednego za dlugo
		--print(getCreatureTarget(cid))
		--print('tc' ..os.time() - getLastTargetChange(guid))
		--print('a' .. os.time() - getLastAttack(guid))
		return false
	else
		return false
	end
end

function addIgnored(guid, pid, ignoreTime)
	if(ignoreTime == nil) then
		ignoreTime = 5
	end
	if(b_ignored[guid] == nil) then
		b_ignored[guid] = {}
	end
	b_ignored[guid][pid] = os.time() + ignoreTime
end

function resetIgnored(guid)
	b_ignored[guid] = {}
end

function updateIgnored(guid)
	if(b_ignored[guid] == nil) then
		b_ignored[guid] = {}
	end
	for pid, ignoreTime in pairs(b_ignored[guid]) do
		if ignoreTime <= os.time() then
			b_ignored[guid][pid] = nil
		end
	end
end

function isIgnored(guid, pid)
	if(b_ignored[guid] == nil) then
		b_ignored[guid] = {}
	end
	if b_ignored[guid][pid] ~= nil then
		return true
	else
		return false
	end
end

function getTries(cid)
	return math.max(0, getCreatureStorage(cid, 59431))
end

function setTries(cid, value)
	doCreatureSetStorage(cid, 59431, value)
end

function isBot(cid)
	return (getCreatureStorage(cid, 59432) ~= -1)
end

function setBot(cid, bot)
	setPlayerModes(cid, 1,1,1)
	return doCreatureSetStorage(cid, 59432, bot)
end

function isBotActive(cid)
	return (getCreatureStorage(cid, 59433) > -1)
end

function setBotActive(cid, active)
	setPlayerModes(cid, 1,1,1)
	if(active) then
		recalculateHPandMana(cid)
		doTeleportThing(cid, getTownTemplePosition(math.random(1, 5)))
		doCreatureSetStorage(cid, 59433, 1)
		db.executeQuery("UPDATE `players` SET `online` = 1 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
	else
		recalculateHPandMana(cid)
		doTeleportThing(cid, {x = 12, y = 139, z = 5})
		doCreatureSetStorage(cid, 59433, -1)
		setTmpDeaths(cid, 0)
		setTmpAssists(cid, 0)
		setTmpFrags(cid, 0)
		setLastAssists(cid, 0)
		setLastFrags(cid, 0)
		db.executeQuery("UPDATE `players` SET `online` = 0, `tmp_kills` = 0, `tmp_deaths` = 0, `tmp_assists` = 0 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
	end
end

function getBotNameByID(id)
	return b_names[id]
end

--[[
function 
end

function 
end

function 
end
]]

l = loadPlayer
s = setBot
g = getPlayerByName

function b(name)
	setBot(getPlayerByName("nob" .. name), 1)
end
function a(number)
	loadPlayer("nob" .. number)
end