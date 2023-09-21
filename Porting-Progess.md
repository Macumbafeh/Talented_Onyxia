### 21 September 2023, 1400 EST
All Player Talents should work.  I got Hunter Pet Trees working, but needs more testing.  I don't know if localizations (changing the language in the client) will break how I got it working, so if you use a non-english client localization, please test that for me and let me know/file an issue if it's broken.  Imports/Exports from website URLs still needs fixed.  Also need to check grabbing talents via inspecting players.

Long-term goal:  Getting the addon to automatically detect what Expansion Phase the server is on, and adjust automatically to TBC and Wrath talents (to not require a re-install of the addon each time the server updates to a new expac).

----
I got talents displaying correctly in the UI (Screenshot of Mage Talent Tree: https://i.imgur.com/1IM91GN.png) 

----
### 19 September 2023
Tested all classes, and there are no errors for PLAYER talents that I found.  Unfortunately Hunters cause an error/addon crash when they tame a pet due to pet talent changes.  Working on that next, and as soon as I have a version that runs without crashing, I'll update the Github so people can use it.

Notes on Pet Talents: Warmane seems to be using the default trees (Ferocity/Cunning/Tenacity)...but sending custom talents depending on the pet family (cat/boar/etc) you have tamed.  The talents are oddly indexed at first glance (top left is index 1, next over is index 2, index 3 is nil, index 4 skips to the row under 1, index 5 jumps to the bottom right, lots of skipped indexes and jumping around the "tree".  This may be because certain abilities have certain positions/indexes, but only show if the tamed pet had the ability in vanilla...example: Bite always seems to have index 2 after looking at a couple different families of pets.)  I don't think I can make pet templates work, but should be able to get the addon to display current pet's talents with a little work.


----
### Older Updates
But it looks like I was incorrect about the data format being incorrect (struck-through text below)...I just had some bad characters in the data formatting.  Fixed that and doing a bit more testing to make sure, then I'll upload the fixed code to the repository.

Also on the todo list is to figure out how Warmane is doing Pet Trees and try to impliment it into Talented.

-----

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
