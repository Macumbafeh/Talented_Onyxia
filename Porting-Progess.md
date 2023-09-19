I got talents displaying correctly in the UI (Screenshot of Mage Talent Tree: https://i.imgur.com/1IM91GN.png) 

But it looks like I was incorrect about the data format being incorrect (struck-through text below)...I just had some bad characters in the data formatting.  Fixed that and doing a bit more testing to make sure, then I'll upload the fixed code to the repository.

Also on the todo list is to figure out how Warmane is doing Pet Trees and try to impliment it into Talented.

~~but the format they're saved in to display correctly ([data format](https://github.com/LezChap/Talented_Onyxia/blob/cedd5158518a7d079d9de97a0acf86998925b6f3/Talented/Data.lua#L23-L34)) does not match the rows/columns that are sent from the server, which means you get a long list of "errors" when you load your talents.  Still loads and works, and you can preview the talents of other classes, but I'm doubting that templates will work correctly if you try to use them to spend points.~~

~~## Example from a Mage:~~
~~- invalid req for talent 1 14 Arcane Mind 4 3 2 3~~
~~- invalid req for talent 1 15 Arcane Instability 4 5 4 2~~
~~- invalid req for talent 1 16 Arcane Power 5 6 2 2~~
~~- invalid row for talent 2 13 Critical Mass 5 6~~
~~- invalid row for talent 2 14 Blast Wave 5 6~~
~~- invalid req for talent 2 14 Blast Wave 3 3 2 3~~
~~- invalid row for talent 2 15 Fire Power 6 7~~
~~- invalid row for talent 2 16 Combustion 7 8~~
~~- invalid req for talent 2 16 Combustion 4 5 2 2~~
~~- invalid column for talent 3 10 Improved Blizzard 4 3~~
~~- invalid row for talent 3 11 Arctic Reach 4 3~~
~~- invalid column for talent 3 11 Arctic Reach 1 4~~
~~- invalid column for talent 3 12 Frost Channeling 2 1~~
~~- invalid req for talent 3 13 Shatter 3 2 1 3~~
~~- invalid req for talent 3 17 Ice Barrier nil 5 nil 2~~
~~- Talented: WARNING: Talented has detected that this talent data is outdated.  Talented will work fine for your class for this session but may have issues with other classes.  You should update Talented if you can.~~

~~For all the invalid lines, the first number is the tab, the second number is the talent index (count from left to right, top to bottom).  If it's row/column invalid, the first number is what row/column the server says the talent should be, and the second number is where it's decoded from the Data.lua (linked above).  For req lines, the first number is the row the server says, the second is the row the Data.lua says, and the second two are the same for the column.~~

~~I see two ways to fix this...and neither are appealing.  Either I re-write the UI and Data parsing code to try to make it match the server data...or I try to merge over to the data handling in the Classic version of this mod, as it looks much more legible. (https://github.com/Lethay/TalentedClassic).  I'm leaning towards the latter, but either way, it feels like it's going to be a bit of work (for me and my skill level).~~
