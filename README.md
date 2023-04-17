# 2023-group-1
### Team
Alex Cockrean, Zoe Clark,  Leon Chen, Li Hanyu, ...
<img src='/images/Group-1.png'/>

### Introduction (5% ~250 words)
Our game is a simple 2D platformer, a la Mario etc.  It allows one-player and two-player modes.  It is novel because gravity randomly flips during gameplay from down to up, and vice versa.
[Describe your game, what is based on, what makes it novel?]

### Requirements (15% ~750 words)

**Ideation, Use-Cases and User Stories**  
To start the ideation process, we had an in-person brain-storming session.  In this session we came up with a short list of six games that we thought we could make.  With a vote, we trimmed this to two games (a connect-four game where the rows are sometimes destroyed, and a platformer game where gravity inverts).  For both of these games we gathered initial requirements by preparing a [use-case diagram](#use-case-diagram), [use-case specifications](#use-case-specifications) and [user stories](#user-stories).  We then used these reasources to mock-up paper prototypes for both games.  We used these paper prototypes to prepared videos demonstrations of how both the [Connect4](https://youtu.be/wAT3H2MjvIE) and the [MarioStyle](https://youtu.be/0fppWHDHL3Y) games should work.
<br>


**Use-Case Diagram**

<img src='/ReportMaterial/Use-Case-Diagram.jpg'/>


**Use-Case Specifications**

*Easy Mode:*

| Use-Case Section | Single Player Game | Two Player Game |
| ---------------- | ------------------ | ----------------|
| Description      |  A run through of the game on normal (non-hard) mode with one player  | A run through of the game on normal (non-hard) mode with two players |    
| Basic Flow:      | Complete the level with no loss of life | Complete the level with no loss of life |
| 1.  | User presses the left, right and up keys to run accross platforms and jump from one to the next | Both users use the keyboard (player one: left, right and up, player two: A, D and W) to run accross platforms and jump from one to the next |
| 2. | The user collects coins and increases the score number | Both users collect coins to add to their combined score count. They work together to navigate the level |
| 3. | The user navigates all the way through the map to the flag where the game is won | The users navigate all the way through the map to the flag where the game is won |
| Alternative Flow: | Collision with enemy or falling off the map leads to loss of life and end of game | Collision with enemy or falling off the map leads to loss of life and end of game |
| 1. | User presses the left, right and up keys to run accross platforms and jump from one to the next | Both users use the keyboard (player one: left, right and up, player two: A, D and W) to run accross platforms and jump from one to the next|
| 2. | The user falls off a platform and loses a life. They are returned to the begining of the map | One of the players falls off the platofrms and the number of remaining lives decreases |
| 3. | The user falls off two more times or touches a zombie while attempting to complete the map | One of the two players falls off and the life number decreases and then this happens again |
| 4. | The user has lost all of their lives and the game over screen is shown with the option to try again | The life number drops to zero and the game over screen is shown with the option to play again |

<br>

*Difficult Mode: Gravity Flips*

| Use-Case Section | Single Player Game | Two Player Game |
| ---------------- | ------------------ | ----------------|
| Description      |  A run through of the game on hard mode where gravity flips occasionally with one player |  A run through of the game on hard mode where gravity flips occasionally with two players |    
| Basic Flow:      | 
| 1.  | The user navigates around the map using the left, right and up arrow keys |  |
| 2. | The gravity warning appears and the user tries to make sure they are under another platform to be protected then they are returned to normal gravity |
| 3. |   |
| Alternative Flow: | |
| 1. | |
| 2. | |
| 3. | |


<br>

**User Stories**

>“As a player, I want to be able to play a satisfyingly challenging game that requires some skill so that I feel engaged, interested and entertained.” 


>“As a second player, I want to be able to have fun racing against my friend to complete a level so that I can have just as much fun or more playing with two players than on my own.”


>“As a player, I want to be able to view my scores so that I can see myself improve as I learn the skills of the game.”

>"As a player, I want to be able to see how many lives I have left during the game, so that I feel a sense of urgency while playing"


<br>
<br>

**Statement of Services**  
We intend our game to provide one or two players with platform-style game play, navigating a sprite through a game map in order to complete the level. The user will initially, upon loading the game, be able to select whether to play with one or two players or to view the leaderboard. Gameplay consists of using the arrow keys or WASD (as the second player) to jump between platforms collecting coins and avoiding obstacles. Our 'twist' —which is active when playing on the more difficult mode— flips the gravity of the game. The sprite will have to navigate the map upside down.

**Inputs and Situations**    
The user can use the keyboard to interact with the game. Using left and right keys will move the character (and the screen view) so that the sprite can move through the map. The user can jump using the up arrow (W as the second player), always being pulled back to the ground. When gravity is flipped the character's orientation will change and pressing the up arrow (or W) will 'jump' the character down on the screen before they are pulled back up by the reverse gravity. The level is completed when the user navigates the sprite to the flag at the end of the level. The user has three lives which are lost if the sprite falls off the platforms in the map or if the sprite touches a zombie character. After losing a life the user is returned to the start of the level to try again, unless they have lost their last life when the screen will read 'game over'.

**Constraints**  
We made the decision to only allow the user to move the sprite left, right, and up, but not down. This is because one of the highlights of our game is the element of gravity which should do all of the downwards motion that is available to a character. Characters cannot move totally freely around the screen for precisely this reason, they will always be constrained by gravity. 



### Design (15% ~750 words)

**Class diagram**
To assist us in organissing our ideas, and planning the work that we would need to do, we developed a [class diagram](ReportMaterial/classDiagram.pdf) for our game.  This diagram gave us a plan of what we needed to implement, and how we could sensibly divvy up the work.  In the end, our program deviated from it when we became more familiar with Processing, and the requirements that it imposes, and carried out evaluation steps on our intermediate products in order to determine how to improve it.  However, the backbone that is illustrated by our class diagram is still evident in out final product.

**Modelling behaviour - Communication diagrams**


**Modelling behaviour - Sequence diagrams**


[System architecture. Class diagrams, behavioural diagrams.]

### Implementation (15% ~750 words)
Describe implementation of your game, in particular highlighting the three areas of challenge in developing your game.

### Evaluation (15% ~750 words)
One qualitative evaluation (your choice)
One quantitative evaluation (of your choice)
Description of how code was tested.


**Think Aloud and Heuristic Evaluations**  
We collected think aloud evaluations at two stages in the development process. These drove our next stages of development as we worked to improve areas that were highlighted as problems by different users. Our final stage evaluations helped us spot some final changes to be made and allowed us to hone in on the finished product.
<br>
<br>

**Stage 1:**

>*Evaluation 1: 13/03/23*
>
>Postitives:
> The character design is good. The character has a realistic jumping and falling motion 
> 
> Negatives:
> The level design makes the game quite hard to play. The character cannot yet collect the boost items though the items still appear on the screen blocking the character's movements. There are also no background graphics yet. 
<br>

<br> 
 
>*Evaluation 2: 13/03/23*
>   
>Postitives:
> The graphics are generally good. 
> 
> Negatives:
> The map is very small and some parts are too hard to navigate. The buttons on the start screen do not align with the places you have to click which is confusing i.e. you have to click the text rather than the buttons. And, you cannot die, you just fall off the map and fall indefinitely.
<br>

<br>
At this stage we also completed our first [heuristic evaluation](ReportMaterial/HeuristicEvaluation1.pdf). This confirmed what had been raised in the think aloud evaluations: that the start screen needed to be changed as it was giving incorrect or sometimes no feedback to the user when they clicked certain buttons. We also learned through the heuristic evaluation that we may need to add some more documentation to the game including instructions about precisely how to play and what to expect.
<br>

We also conducted a focus group at this stage. [Research suggested](http://dx.doi.org/10.1109/ISESE.2004.1334914) this would be a resource-effective approach to collecting qualitative feedback especially with accessible software such as a game. The results from our focus group suggested...

After these initial evaluations we had some clear goals for the next stages of development. Firstly, the map needed to be changed as it was too small and very difficult. The design feedback was generally good apart from our start and end screens. Finally, we needed to add features to interact with other game elements —to collect objects or be damaged or blocked by them. 
<br>
<br>


**Stage 2:**

>*Evaluation 3: 12/04/23*
>
>Postitives:
> The start screen looks good. You can collect points by collecting coins and lose lives when you fall off the map. The map is challenging but possible to complete. You can play with two players and when the game is over you have the option to play again.
> 
> Negatives:
> There is a delay sometimes when clicking buttons and their responses. 
<br>

<br> 
 
>*Evaluation 4: 12/04/23*
>   
>Postitives: The game is much clearer in its layout and the feedback you get as a user. You can see the score and how many lives you have left. You can play with two players now. 
> 
> 
> Negatives:
> There is one small part of the map which is impossible to access. Maybe there should be instructions about which keys to use for the second player.
<br>

<br>

A month after our initital evaluations, it was encouraging to see that many of the points raised in the first stage evaluations had been addressed. The concerns in the second stage evaluations also required smaller changes. 

**Quantitative evaluation - NASA TLX**

We carried out a bifurcated quantitative evaluation of our product - one evaluation of the navigability and usability of the naviagation pages around our game (e.g., the welcome screen and the game over screen), and one of the difficulty of the game.  The reason for this is that the aim of navigation pages is always for them to be usable, and so minimising the difficulty of these pages is always a good thing.  Whereas for the gameplay of our game, we do want there to be a degree of difficulty (there is no fun in a game that a child could complete on its first attempt).  Therefore, it made sense to quantitatively evaluate these separately to avoid cross-contamination of results, and the loss of information.  

For both furcations of the evaluation we used weighted NASA TLX scores.  For the navigation page, we had the survey complete by ten different people at two different points of development - the first being after we had developed a minimum viable product, and the second being after our sprints in Easter when the product was in a more final state.  We compared these two sets of results using the Wilcoxon Signed Rank Test to see if the changes we had made to the navigation pages had made a meaningful difference to their usability.  

For the game itself, we had the survey completed at only one point (adter the sprtins in easter), but we had it completed in relation to both the hard and easy difficulty settings of our game.  Again, we compared the results of these two difficulty settings to see if the differences in the two settings made the game meangingfully nore difficult.  The results for both evaluations are provided below, and the calculations shown.

>**Evaluating the navigation pages**
>
>The first quantitative evaluation was carried out between 12/3/2023 and 14/3/2023. 
>
>>***Evaluation 1***
>>
>>*Scores*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration | 
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 |
>>| 2 |
>>| 3 |
>>| 4 |
>>| 5 |
>>| 6 |
>>| 7 |
>>| 8 |
>>| 9 |
>>| 10 |
>>
>>*Dimension weighting*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration | 
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 |
>>| 2 |
>>| 3 |
>>| 4 |
>>| 5 |
>>| 6 |
>>| 7 |
>>| 8 |
>>| 9 |
>>| 10 |
>
><br>



### Process (15% ~750 words)
Our team worked together effectively.  We used [Kanban boards](ReportMaterial/KanbanBoards) to keep a track of the outstanding tasks (We used Atlassian to host these, but saved PDFs of the board at various stages of development for our report). We used GitHub to host our work, as was required by the unit.  However, the way we used it developed throughout the project.  We had a game-jam in reading week.  This was a whole-day affair, and was the first significant chunk of time we spent as a team developing the game.  While we were using GitHub to keep a track of our changes, we ran into problems because we had not formalised an agreed-upon workflow.  Therefore, noone was using branches.  Rather we we commiting straight to 'main', or even dropping files directly into the github repo via the gui.  This lead to the situation where people were making great features on their local copy of the repo, but that this was completely different to everyone else's local copy.  Therefore, even though we had managed to make a minimum-viable-product locally, this was not reflected on the GitHub, and took a lot of work to fix (many thanks to Ollie, the TA for helping us untabgle the knots).  Fortunately we were able to recover our work, and this mishap prompted us to  use a standardised Git workflow.  Everyone had a personal branch.  When they were ready with a feature, they had to checkout their local main, pull from origin, checkout their personal branch, merge with main, and only when all conflicts were resolved could they push.  When pushed they had to make a pull request to get their changes into main.  This system worked for us, and we didn't have any other Git mishaps.

Throughout the project we continually delegated tasks between ourselves. We used Whatsapp to stay connected and updated with any changes or concerns we ran into through the development process. This allowed us to address anything which was a "quick fix" over message without the need to organise a scheduled team meeting. We found this helped us work efficiently and with a greater degree of freedom. We split up different features between ourselves so that we could work independently. Though, during our game-jam we found the practise of pair-programming helpful to get started on setting up the foundations of the game. Working together in one room allowed us to talk about and share code so that we all understood and were in agreement about what the first key features of the game should be. 

Teamwork. How did you work together, what tools did you use. Did you have team roles? Reflection on how you worked together.

### Conclusion (10% ~500 words)
Reflect on project as a whole. Lessons learned. Reflect on challenges. Future work.
Quality of report writing, presentation, use of figures and visual material (5%)
Documentation of code (5%)
Individual contribution. Provide a table of everyone's contribution, which may be used to weight individual grades. We expect that the contribution will be split evenly across team-members in most cases. Let us know as soon as possible if there are any issues with teamwork as soon as they are apparent.
