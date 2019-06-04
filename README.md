# MKS22X-FinalProject
By: Amanda Chen and Kevin Chen
***
# Project Description
Candy Crush
🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬

## 📝 Final Project Log

### Date: 5/20/19
Kevin: 
       The basic foundation was made. 
       Intital files, intital instance vairables, and constuctors. 

Amanda: 
       Moved all the code to Processing and formatted it so it works properly. 
       Started the visual portion of the game: created the window, added a background, and drawed the board.
       

Details: Created the Board, Project, Candy, NormalCandy, and Special Candy files. Created a project folder for proccessing. Added all the instance variables located on the UML diagram. Created Constructors. We moved all the files into processing. Fixed the errors that processing gave us. Created our dimensions and imported pictures.

### Date: 05/21/19
Kevin:
       Changed UML model.
       Removed variables.
Amanda: 
       Modeified some variables to add colors to the candies and had the candies show up on the board.
       
 Details: Noticed that many variables were redundant, so they got remvoed. Fixed the reset function accordingly. Added in a color array to input rbg values, because we realzie we couln't use hexicode. Decided to use circles to subsitute for candy for now. Have not completely decided on a theme for this game yet.
 
### Date: 05/22/19
Amanda: 
       Started writing the swap code

Kevin: 
       Added a Check Function that sets pop to true and fixed some broken code and merge errors

Details: Swap code uses the current swap code that works on the board. We implemented it so that it would also work just by clicking on the board. Check function is fully implemented. It would just check the board to see if any orb should be poped.
       
### Date: 05/23/19
Kevin: 
       Finished the pop() function.
       
Details: Pop function is used to remove the orbs that are checked by the check function.

### Date: 05/24/19
Kevin: 
       Candy now falls down the board.
       Looped the entire game tother.
Amanda: 
       Finished the swap function and fixed merge errors.
       Worked on Mouse click function.
       
Details: We realized the code doesn't work to well with the draw function so we had to rewrite all the other functions. We also rewrote the fall function, so that the orbs move down the board when there is an empty space avaliable. The swap function now fully uses the mouse click method. IT WORKS!!!!!! The base game is basically done at this point.

### Date: 05/28/19
Kevin: 
       Did commenting on the code.
       Fixed bug errros.
Amanda: 
       Changed layout of board for easier animation in the future and fixed readibility of code.
       
Details: Went to start increase readability because we are mostly done with the main game. We began with notation in Normal and Special Candy. Also changed bracket notation for increase readibility. Some minor bug errors appeared that required quick fixes.

### Date: 05/29/19
Amanda: Split game function into two so the board now shows empty squares before candy falls.

Details: Game function split so we can show a state of empty squares. This allows the player to watch the orbs fall down the board.

### Date: 05/29/19
Kevin:
        Started fixing the animation. 
        Wokred on readability of code.
Amanda: 
        Puff of smoke appears when orbs are popped.
        Board is now transparent again.
        Selected squares are now highlighted and disappear after two clicks.
        
Details: Prototype animation. This creates kind of like a slide show that makes the orbs slowly fall down the screen. We also added puff smokes that indicate when a orb has been popped. We made a design choice to make the squares transparent to allow the player to see the background image. Started working on highlighting the square to increase visablity.

### Date: 05/30/19
Amanda: 
        Added puff of smoke animation when orbs are popped.
        Wrote highlight method to highlight sqaures after clicking on them.
        
Kevin: 
        Seperated Check function.
        Check2() and Check3() is used to calculate points.
        Fixed bugs that required math.
        
Details: Puff of smoke represents an explsion for the orbs. There is a highlight method to show the player which orb they clicked on. This is implemented by making the background square a lighter color. Had to split the check funcuntion to calculate how many chains there are. Also implemented a points function to easily calucalte how many points the player should be awarded. This is calculated by 100 points for each orb popped that is under a chain of 3. Chains of 4 gets 500 points. Chains of 5 or more gets the link times 150 points.
        
### Date: 05/31/19
Amanda: 
        Changed location of score displayed on screen.
        Downloaded all candy images into folder.
        
Together:
        Brainstormed ideas on new animations, pictures and future features.

### Date: 06/01/19
Kevin: 
        Fixed full scale animation. It works like netlogo turtles.
        Fixed Bug errors.
       
Together:
        Decided on the theme of the game we were going to make.

Details for May 31 and June 1st. We kinda hit a wall. We implemented the majority of the base game. We talked about which theme we should take up. We also talked about which features we will implement in the next few days. We decided to work on special candy, fall animation, design, fonts, shuffle, restart and sound for now. More features after Wendesday.

### Date: 06/02/19
Amanda: 
        Fixed fall animation.
        Rewrote and combined repititive method.
        Fixed highlight,swap, and pop animation.
        Replaced all orbs with pictures of candy and adjusted code to fit change.
        
Kevin:

### Date: 06/03/19
Amanda: 
        Recentered all images on board and fixed fall animation again.
        Added moves and shuffle.
        Added scoreboard to screen showing moves, score, and a shuffle button.
        Added endgame method that clears board.
        Added restart game button.
        
Kevin:
