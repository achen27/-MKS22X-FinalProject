# <center> MKS22X-FinalProject </center>
By: Amanda Chen and Kevin Chen
***
## 📑Table of Content
   1. [Project Descriptions](https://github.com/achen27/MKS22X-FinalProject#project-descriptions)
   2. [Directions](https://github.com/achen27/MKS22X-FinalProject#directions)
   3. [Final Project Log](https://github.com/achen27/MKS22X-FinalProject#-final-project-log)


## Project Descriptions

### Candy Crush
🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬🍬

![alt text](https://github.com/achen27/MKS22X-FinalProject/blob/master/project/p1.png)

Our project is very similar to Candy Crush. We designed the game without looking at any of the existing match three code that already exist online, so our project may look strange compared to other match three projects. Our project consist of a board, colored candy, point values, and buttons for shuffle and reset. We also have a special candy that either pops the column, row, or 3x3. The goal is to get a set amount of points within a certain amount of moves.








## Directions
       1. Go to project folder.
       2. Open the game in processing
       3. Download the sound library in processing. Go to Sketch -> Import Library -> type in sound -> Download
       4. Press Play!
       5. Click 2 candies to swap and match them.
       6. If you can't find any moves press shuffle to suffle the board.
       7. Press Reset if you lose.
       8. Have FUN! 🥴
       
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

       Added a Check Function that sets pop to true and fixed some broken code and merge errors ✔️

Details: Swap code uses the current swap code that works on the board. We implemented it so that it would also work just by clicking on the board. Check function is fully implemented. It would just check the board to see if any orb should be poped.
       
### Date: 05/23/19
Kevin: 

       Finished the pop() function.
       
Details: Pop function is used to remove the orbs that are checked by the check function.

### Date: 05/24/19
Kevin: 

       Candy now falls down the board.
       Looped the entire game tother. 🔁
Amanda: 

       Finished the swap function and fixed merge errors.
       Worked on mouse click function. 🐁
       
Details: We realized the code doesn't work to well with the draw function so we had to rewrite all the other functions. We also rewrote the fall function, so that the orbs move down the board when there is an empty space avaliable. The swap function now fully uses the mouse click method. IT WORKS!!!!!! The base game is basically done at this point.

### Date: 05/28/19
Kevin: 

       Did commenting on the code.
       Fixed bug errros. 🐛
       
Amanda: 

       Changed layout of board for easier animation in the future and fixed readibility of code.
       
Details: Went to start increase readability because we are mostly done with the main game. We began with notation in Normal and Special Candy. Also changed bracket notation for increase readibility. Some minor bug errors appeared that required quick fixes. 

### Date: 05/29/19
Amanda: 

       Split game function into two so the board now shows empty squares before candy falls.

Details: Game function split so we can show a state of empty squares. This allows the player to watch the orbs fall down the board.

### Date: 05/29/19
Kevin:

        Started fixing the animation. 
        Worked on readability of code.
Amanda: 

        Puff of smoke appears when orbs are popped. 💭
        Board is now transparent again.
        Selected squares are now highlighted and disappear after two clicks.
        
Details: Prototype animation. This creates kind of like a slide show that makes the orbs slowly fall down the screen. We also added puff smokes that indicate when a orb has been popped. We made a design choice to make the squares transparent to allow the player to see the background image. Started working on highlighting the square to increase visablity.

### Date: 05/30/19
Amanda: 

        Added puff of smoke animation when orbs are popped. 💭
        Wrote highlight method to highlight sqaures after clicking on them.
        
Kevin: 

        Seperated Check function. ✔️
        Check2() and Check3() is used to calculate points. ✔️
        Fixed bugs that required math. 🐛
        
Details: Puff of smoke represents an explsion for the orbs. There is a highlight method to show the player which orb they clicked on. This is implemented by making the background square a lighter color. Had to split the check funcuntion to calculate how many chains there are. Also implemented a points function to easily calucalte how many points the player should be awarded. This is calculated by 100 points for each orb popped that is under a chain of 3. Chains of 4 gets 500 points. Chains of 5 or more gets the link times 150 points.
        
### Date: 05/31/19
Amanda: 

        Changed location of score displayed on screen.
        Downloaded all candy images into folder.
        
Together:

        Brainstormed ideas on new animations, pictures and future features. 🤯

### Date: 06/01/19
Kevin: 

        Fixed full scale animation. It works like netlogo turtles. 🐢
        Fixed Bug errors. 🐛
       
Together:

        Decided on the theme of the game we were going to make. 🤯

Details for May 31 and June 1st: We kinda hit a wall. We implemented the majority of the base game. We talked about which theme we should take up. We also talked about which features we will implement in the next few days. We decided to work on special candy, fall animation, design, fonts, shuffle, restart and sound for now. More features after Wendesday.

### Date: 06/02/19
Amanda: 

        Fixed fall animation.
        Rewrote and combined repititive method.
        Fixed highlight, swap, and pop animation.
        Replaced all orbs with pictures of candy and adjusted code to fit change.
        
Kevin:

       Worked on a cloner method to fix fall.
       Began working on special candies.
       
Details:
       Fall animation was kinda cluncky. It was too slow, so we made it faster. We also combined some functions that we deemed unessary. We fixed the highlight animation. The highlight animation was very consistent before this change. We also fixed the pop animation. The puff clouds disappeared too fast. We also created a cloner method becuase the old method only worked with normal candy. We also started using pictures. These picutres were imported from candy crush. The speical Candy was a black circle before this change. 

### Date: 06/03/19
Amanda: 

        Recentered all images on board and fixed fall animation again.
        Added moves and shuffle.
        Added scoreboard to screen showing moves, score, and a shuffle button.
        Added endgame method that clears board.
        Added restart game button.
        
Kevin:

        Clean up code.
        Worked on changing the speeds of the candies. 
        Fixed bugs relating to animations and fall. 🐛
        Found and fixed bugs relating to special Candy. 
        Added music into the game. 🎼
        
Details:
       Designed the game so it looks like a proper game. We added a suffle mechanic. It uses the int[][] shuffle that already existed. We added a move counter. This gives the player a set amount of moves before the game was over. We added a penalty of 5 moves if the shuffle mechanic is used. We created a proper score screen. We added a reset method that resets the board. We added an endgame method that clears the board when the game is over. We began cleaning up code for the demo. We began tweaking some of the older methods to make it smoother. We added music to the game and SFX pop effects. These require a library and we are not sure if this is allowed, so we added a seperate file inside experiment, so we don't get flamed later. 🔥
