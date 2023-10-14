### 14 October 2023
Forgot to add my "dev notes". I realized that the template<-->string functions weren't working for Pets. Wasn't throwing any errors or crashing the addon, but because Onyxia's pet talents go above 5 ranks, it wasn't loading them from string correctly. Got that fixed by taking a note from how WoWHead is now doing talent trees, but using base-hex isntead of decimals for when TBC pet talents (are expected) to go past 10, just to keep each talent's rank-code to a single character in the string.

I also started working on the coding that will make the addon transition from Vanilla>TBC>Wrath automatically as the realm progresses.  That's going to take a bit more to complete, including coming up with all the TBC data in Data.lua (some of which I can't even get until Warmane transitions the PTR to TBC), but what I got so far isn't breaking the addon in Vanilla era.  Also have another importer/exporter to work on including for Vanilla Phase (https://classicdb.ch/?talent), so add that to the To-Do list.

Finally, I've started looking at Backwards Compatibility.  By that, I mean when Onyxia transitions to Wrath, or when a player switches to Icecrown or another Wrath realm, I want this Port to work seamlessly with anyone who using Kader's version (sending/receiving templates and other such communications).

### 10 October 2023, 9pm EST
Inspections worked without needing any fixes.  I commented out all the imports/exports from Kader's version (Wrath trees) since they won't work in Vanilla or TBC phases (but aren't deleted for when I start working on making the addon automatically update to work in Wrath Era).

Added a WoWHead importer/exporter that works for Vanilla trees, and shouldn't need any changes when TBC/Wrath comes around.  If there are any other (good) sites that implement Vanilla or TBC talent calculators, put them in an issue on the GitHub so I can work on getting them coded in.

### 9 October 2023, 6pm EST
Took some refactoring and hair pulling, but I finally think I got templates for pets working without breaking any of the other templates.  **MAKE SURE YOU DELETE YOUR OLD TALENTED SAVED VARIABLES IF YOU HAVE ISSUES**...old templates that are stored there may cause problems with the new code.  Pet Templates may show errors in your chat if you try to apply them and don't meet level requirements for the rank(s) you're attempting to apply.

Next step will be making sure inspection is working, and then on to getting import/exports working.

### 28 September 2023, 3:30PM EST
So I fixed the pet tree error from last night.  Silly me forgetting Lua tables are objects and setting a new table equal to the master table (like a normal variable) creates a reference and not a copy/clone of the table.  Fixed that, and now the Pet Trees seem to be working perfectly and changing/updating correctly.  Still not sure how they'll act to non-English localizations (test and tell me please!).  And I haven't tested each pet family yet.  I'm also not sure on the total number of pet points available at 60, or how the math is done for earning pet points, so that code will need adjusted as I get it.

As always, if you're using the Addon and fine any bugs or things not working that I said are, please report them to the Issues so I can try to iron them out and fix them.

tl/dr: The core features of the Addon seems fully functional for all classes. Here's the To-Do list moving forward:
* Import/Export (to/from URL strings) working.
* Make Templates accessible for Pet Family Trees.
* Check/fix the "Inspect Target" to get talent trees/templates functionality.
* Make Addon adapt automatically as Realm progresses from Vanilla to TBC and finally Wrath.

### 27 September 2023, 11PM EST
I took a few days waiting for a response on the devs on a possible API change around GetTalentTabInfo(...) returning the 3 Wrath pet trees (Ferocity/Tenacity/Cunning) instead of Pet Familes (Cat/Boar/Bear/etc)  Warmane's Onyxia design is to put each Pet Family's trainable skills from Vanilla into a "Pet Talent Tree" for that family...but it's doing it oddly compared to how Blizard has sent talents before (ie talents aren't in consecutive indexes in the custom data tables for Onyxia).  (If you want to read more on that: https://www.warmane.com/bugtracker/report/118550 and https://www.warmane.com/bugtracker/report/118519#comment-109931 )  Once they said they weren't going to change it, it took a few days to code up the data, and finding all the minor changes needed to make to get it to parse through the data tables (mostly?) correctly.  In the process, I tried to bring back (in commented out code) all the code I removed or edited from the Wrath version that doesn't apply to Vanilla (like Glyphs) to make the Long-term goal of making the addon automatically switch to using it again when we move between the phases on Onyxia. However, there's still a problem with the Pet Talent Window not wiping buttons/skills when you swap pets. I will start to troubleshoot and fix next, but it's bedtime I wanted to get a version up that doesn't crash the addon completely when switching pets.

I don't recommend the addon for Hunters until I finish chasing down the Pet Tree bugs, but it should work perfectly for everyone else.

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
