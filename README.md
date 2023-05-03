# 2023-group-1
### Game Video
[<img src="/ReportMaterial/TopsyTurvyHeader.png" />](https://youtu.be/8dYYDsnezjE)

Click [here](https://youtu.be/8dYYDsnezjE) or on the image above to watch our game video!

### Team
Li Hanyu, ZYJ, Leon Chen, Zoe Clark, Alex Cockrean
<img src='/images/Group-1.png'/>

### Introduction
Our game is a one or two player platform game with an added twist. It was inspired by platform games that we loved like Super Mario Bros. Our twist on classic games like this was to add the feature of gravity flipping at intervals of time, in order to increase the difficulty of the game. We developed our own game storyline and lore to immerse the player in the experience invest them in the outcome of the game. Throughout the game development process we tried out many different development techniques in order to find what worked for us as a team. For this reason, it made sense to use an agile workflow throughout so that we could reflect on our progress and repeat cycles of development to make the most of different techniques that worked well for us.

---

### Requirements

**Ideation, Use-Cases and User Stories**  
To start the ideation process, we had an in-person brain-storming session.  In this session we came up with a short list of six games that we thought we could make.  With a vote, we trimmed this to two games (a connect-four game where the rows are sometimes destroyed, and a platformer game where gravity inverts).  For both of these games we gathered initial requirements by preparing a use-case diagram, use-case specifications and user stories.  We then used these resources to mock-up paper prototypes for both games.  We used these paper prototypes to prepare videos demonstrations of how both the [Connect4](https://youtu.be/wAT3H2MjvIE) and the [MarioStyle](https://youtu.be/0fppWHDHL3Y) games would work. After this we sat down and decided on the platform game as our final idea.
<br>

<img src="/ReportMaterial/paperPrototype.gif">

<br>


**Use-Case Diagram**

<img src='/ReportMaterial/Use-Case-Diagram.jpg'/>

<br>

**Use-Case Specifications**

*Easy Mode: No Gravity Flips*

<img src="/ReportMaterial/UseCaseEasyMode.png"/>

<br>

*Difficult Mode: Gravity Flips*

<img src="/ReportMaterial/UseCaseHardMode.png"/>


<br>

**User Stories**

>“As a player, I want to be able to play a satisfyingly challenging game that requires some skill so that I feel engaged, interested and entertained.”

>“As a second player, I want to be able to have fun racing against my friend to complete a level so that I can have just as much fun or more playing with two players than on my own.”

>“As a player, I want to be able to view my scores so that I can see myself improve as I learn the skills of the game.”

>"As a player, I want to be able to see how many lives I have left during the game, so that I feel a sense of urgency while playing"

>"As a player, I want a warning before gravity flips in the game, so that I can prepare and make progress in the game"

<br>


**Statement of Services**  
>We intend our game to provide one or two players with platform-style game play, navigating a sprite through a game map in order to complete the level. The user will initially, upon loading the game, be able to select whether to play with one or two players or to view the leaderboard. Gameplay consists of using the arrow keys or WASD (as the second player) to jump between platforms collecting coins and avoiding obstacles. Our 'twist' —which is active when playing on the more difficult mode— flips the gravity of the game at random intervals.    

<br>

**Inputs and Situations**    
The user can use the keyboard to interact with the game. Using left and right keys will move the character (and the screen view) to move through the map. The user can jump using the up arrow (W as the second player), always being pulled back to the ground. In hard mode when the gravity is affected the sprite will "feel" the reduced effects of gravity. Jumnping won't bring the character back to the ground immediately. The character will remain in the air until the gravity is brought back. They must safely navigate their landing to survive. The level is completed when the user navigates the sprite to the flag at the end of the level. The user has three lives which are lost if the sprite falls off the platforms in the map or if the sprite touches a zombie character. After losing a life the user is returned to the start of the level to try again, unless they have lost their last life when the screen will show the end game screen and they will have the option to play again and save their score.

<br>

**Constraints**   
We made the decision to only allow the user to move the sprite left, right, and up, but not down. This is because one of the highlights of our game is the element of gravity which should do all of the downwards motion that is available to a character. Characters cannot move totally freely around the screen for precisely this reason, they will always be constrained by gravity.


---


### Design

**Class diagram**   
To assist us in organising our ideas, and planning the work that we would need to do, we developed a [class diagram](ReportMaterial/classDiagram.pdf) for our game.  This diagram gave us a plan of what we needed to implement, and how we could sensibly divide up the work.  In the end, our code deviated from this when we became more familiar with Processing, and carried out evaluation steps on our intermediate products in order to determine how to improve it.  However, the backbone that is illustrated by our class diagram is still evident in our final product.

<img src=ReportMaterial/class.png>

<br>


**Modelling behaviour: Communication diagrams**    
We realised early on in planning that a difficult part of our games mechanics would be how we handle collisions.  Therefore, we decided it was sensible to put together a communication diagram for the process of the user controlling a character (which encompasses collision mechanics).  This diagram is here:

<img src=ReportMaterial/communication.png>

<br>

**Design conclusion**     
Adopting the Agile methodology in our team, we necessarily had to change the the parameters of our design as we released prototypes and gathered feedback from them.  Therefore, the original design documents that we prepared before our first sprint became outdated.  In fact, this quick outdating of design documents, and inability to update them due to quick turnaround of iterations of the product are a good casestudy in some of the shortcomings of an Agile workflow - the push for quickly developing further releases of a product mean that changes and design decision necessarily become reactionary, and overlooks the important process of thoughtful planning as it cannot be repeatedly crammed into a densly packed sprint.  Indeed, this criticism of Agile is shared by many in the field (e.g., this [Harvard Business review article](https://hbr.org/2021/04/have-we-taken-agile-too-far)).

---

### Implementation (742 words)

The three areas of challenge that we identified while planning our game were: 1) creating a physics engine that allows for fluctuating gravity; 2) making a multi-player mode where two players could each control their individual character; and 3) creating a highscores record, which can be viewed on a separate page.  Interestingly, these three challenges actually spanned the gamut of actual challenge, as will be documented below.

**1) Making a physics engine:**
This proved to be the most challenging of our three challenges because it went beyond simply applying gravity to objects.  We also needed a way for objects to interact with one another so that our characters would not go through walls etc.  This was implemented with an iterative check of the borders of sprites before every frame.  As the only sprites that move in a non-pre-determined way are the character sprites (the enemy sprite follows a known path and so we don't need to check it), we designed a function to check whether these sprites were overlapping with any of the platform sprites.  If they were, then we reset the character sprite positions to be just outside the offending platform unit, and set their velocity in the direction into the platform to 0.

For gravity itself, we used a constant value to set what gravity should be, and then a variable to track what gravity is at any given point in time.  The current gravity variable was then applied to the character sprites as a downward acceleration on every frame (when gravity is going up, the current gravity variable is negative).  The current gravity variable is controlled according to a hidden counter variable.  This counter variable is decremented by 1 every frame, and is reset to a random value in a range when it gets to 0.  When the counter is above a first value, the current gravity variable is the gravity constant.  When the counter is below the first value but above a second value, the current gravity variable is a fraction of the gravity constant.  When the counter is below this second value, the current gravity variable is - the gravity constant.  

Jumping directly between current gravity values was quite jarring, so instead we had a handler function, that more gradually moved the current gravity value towards the desired factor of gravity constants.  

Further, to make the gravity changes less predictable, we made it such that when the counter gets to the second value, there is a 50% chance that the counter will be reset there, thus not entering negative gravity on that cycle.

<img src="/ReportMaterial/antigrav.gif">

**2) Multi-player:**
This challenge was not actually particularly challenging.  Once we had made the one-player game, it was simply a matter of finding a way for player two to input their controls, and then making another object of the same class as the one-player character, though with different images.  We chose WASD as the directional inputs for player 2, which meant that player one could continue to use the arrow keys.  The ease of this challenge is a testament to the benefits of OOP, as we just had to fire up another instance of a class.

<img src="/ReportMaterial/2player.gif">

**3) Leaderboard:**
Aside from making another page to view the leaderboard on, the main challenge here was finding a datastructure to store the scores in.  We ended up with a tuple data structure.  Though, annoyingly, Java does not have this datastructure in its standard libraries so we had to make our own.  We decided that the information that was needed to display the scores properly were: i) the player(s) name (we opted to limit this to three letters, as an homage to early arcade games, which were the dawn of this type of 2D platformer); ii) the score value; and iii) whether the game had been won, or the player had died.  

we then stored these tuples in an arraylist, which we sorted everytime a new score was added.  the ordering was not simple, so we had to use a custom lambda-function to sort it.  The lack of simplicity is because we wanted games that were won to be a 'higher score' than games that were lost, regardless of their actual score.

When a player was adding their score to the leaderboard but it fell out of the top-5, we nonetheless showed it below the top-5.  If it was naturally in the top-5, then the leaderboard displayed the top-6.

<img src="/ReportMaterial/leaderboard.gif">

---

### Evaluation

**Think Aloud and Heuristic Evaluations**  
We collected think aloud evaluations at two stages in the development process. These drove our next stages of development as we worked to improve areas that were highlighted as problems by different users. Our final stage evaluations helped us spot some final changes to be made and allowed us to hone in on the finished product.
<br>
<br>

**Stage 1 Qualitative Evaluations:**

>*Think Aloud Evaluation 1: 13/03/23*   
>>Positives:
>> The character design is good. The character has a realistic jumping and falling motion
>>
>> Negatives:
>> The level design makes the game quite hard to play. The character cannot yet collect the boost items though the items still appear on the screen blocking the character's movements. There are also no background graphics yet.    



>*Think Aloud Evaluation 2: 13/03/23*    
>>Positives:
>> The graphics are generally good.
>>
>> Negatives:
>> The map is very small and some parts are too hard to navigate. The buttons on the start screen do not align with the places you have to click which is confusing i.e. you have to click the text rather than the buttons. And, you cannot die, you just fall off the map and fall indefinitely.



>*Heuristic Evaluation 1: 13/03/23*    
>>| Interface | Issue | Heuristic | Frequency | Impact | Persistence | Severity |
>>|---------- |------- | --------- | --------------- | ------------ | ----------------- | -------------------- |
>>| Start Page| Clicked and no feedback about state change on the first page one player or two player buttons | Visibility of System Status | 2 | 3 | 3 | 2.6 |
>>| Start Page | The buttons should look more like buttons | Consistency | 3 | 2| 2| 2.3 |
>>| Main Game | No labels for which keys to use (though immediately used the correct ones) | Help and documentation | 4 | 2| 2| 2.6 |
>>| Main Game | Expect a drop before you actually do — sometimes you can walk on thin air | Consistency | 3 | 3| 2| 2.6|
>>|Main Game | Make gravity a bit lighter so that it is less difficult initially | User Control and Freedom | 2|2|2| 2|
>>| Main Game | You can't see the score | Visibility of System Status | 4|2|2|2.6|

<br>
Sorting the results from our first stage think alouds and heuristic evaluation into categories we saw that some key areas of focus stood out:

 * The map/level design made the game very hard
 *  Start screen buttons need redesigning
 *  You cannot collect items/there is no score

These stood out because they were all raised multiple times but other issues stood out because of the emphasis placed on them during the evaluations. A concern was raised about a lack of documentation around which keys to use and this was given a 4/4 score for frequency of the issue. As was the inability to view the score throughout the game. This suggested to us that these areas should be key areas to focus on.

We also conducted a short focus group at this stage. [Research suggested](http://dx.doi.org/10.1109/ISESE.2004.1334914) this would be a resource-effective approach to collecting qualitative feedback especially with accessible software such as a game.

<img src=ReportMaterial/FocusGroup.png>


After these initial evaluations we had some clear goals for the next stages of development. Firstly, the map needed to be changed as it was too small and very difficult. The design feedback was generally good apart from our start and end screens. Finally, we needed to add features to interact with other game elements (to collect objects or be damaged or blocked by them). It was clear that people liked our idea but that at the moment the execution was not delivering what the game promised.
<br>
<br>


**Stage 2 Qualitative Evaluations:**

>*Think Aloud Evaluation 3: 12/04/23*
>
>Positives:
> The start screen looks good. You can collect points by collecting coins and lose lives when you fall off the map. The map is challenging but possible to complete. You can play with two players and when the game is over you have the option to play again.
>
> Negatives:
> There is a delay sometimes when clicking buttons and their responses.
<br>

<br>

>*Think Aloud Evaluation 4: 12/04/23*
>   
>Positives: The game is much clearer in its layout and the feedback you get as a user. You can see the score and how many lives you have left. You can play with two players now.
>
>
> Negatives:
> There is one small part of the map which is impossible to access. Maybe there should be instructions about which keys to use for the second player.
<br>

<br>

In our second stage qualitative evaluations we recieved more positive feedback than negative. A month after our initial evaluations, we had worked on improving our game in the areas suggested by the prior evaluations. It was encouraging to see that many of the points raised in the first stage evaluations had been addressed. The concerns in the second stage evaluations also required much smaller changes than those raised in the first stage. We were able to address some of the negatives very easily making sure to fix the map so that platforms which should be accessible are and that the response times between button presses and reactions was faster. At this stage we also added instructions and backstory.

**Quantitative evaluation - NASA TLX**

We carried out a bifurcated quantitative evaluation of our product - one evaluation of the navigability and usability of the navigation pages around our game (e.g., the welcome screen and the game over screen), and one of the difficulty of the game.  The reason for this is that the aim of navigation pages is always for them to be usable, and so minimising the difficulty of these pages is always a good thing.  Whereas for the gameplay of our game, we do want there to be a degree of difficulty (there is no fun in a game that a child could complete on its first attempt).  Therefore, it made sense to quantitatively evaluate these separately to avoid cross-contamination of results, and the loss of information.  

For both furcations of the evaluation we used weighted NASA TLX scores.  For the navigation page, we had the survey completed by ten different people at two different points of development - the first being after we had developed a minimum viable product, and the second being after our sprints in Easter when the product was in a more final state.  We compared these two sets of results using the Wilcoxon Signed Rank Test to see if the changes we had made to the navigation pages had made a meaningful difference to their usability.  Before completing the survey, we had the participants use the navigation pages to select 1-player and 2-player modes, select easy mode and hard mode, view the leaderboard, add a score the leaderboard, and return to the main menu.

For the game itself, we had the survey completed at only one point (after the sprints in easter), but we had it completed in relation to both the hard and easy difficulty settings of our game.  Again, we compared the results of these two difficulty settings to see if the differences in the two settings made the game meaningfully more difficult.  before completing the survey, we had the participants play two complete games (either to winning, or to running out of lives).  One of these games was in 1-player mode, and the other was in two-player mode with a volunteer who was neither the participant or the survey collector playing as the second player.

The results for both evaluations are provided below, and the calculations for the first Wilcoxon sing-ranked test shown.

>**Evaluating the gameplay**
>
>Both of the quantitative evaluations of the gameplay were carried out between 17/4/2023 and 19/4/2023.  
>
>>***Evaluation 1 - 'Easy' mode***
>>
>>*Scores*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration |
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 | 15 | 10 | 20 | 20 | 35 | 10 |
>>| 2 | 30 | 0 | 35 | 35 | 45 | 20 |
>>| 3 | 25 | 15 | 50 | 40 | 20 | 30 |
>>| 4 | 30 | 10 | 40 | 40 | 30 | 15 |
>>| 5 | 15 | 15 | 35 | 55 | 35 | 40 |
>>| 6 | 40 | 5 | 40 | 40 | 40 | 25 |
>>| 7 | 40 | 5 | 40 | 25 | 50 | 5 |
>>| 8 | 25 | 0 | 25 | 65 | 20 | 25 |
>>| 9 | 15 | 0 | 60 | 55 | 35 | 15 |
>>| 10 | 30 | 5 | 30 | 20 | 45 | 10 |
>>
>>*Dimension weighting*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration |
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 | 2 | 0 | 2 | 4 | 5 | 2 |
>>| 2 | 3 | 0 | 2 | 5 | 3 | 2 |
>>| 3 | 2 | 0 | 2 | 4 | 4 | 5 |
>>| 4 | 2 | 0 | 2 | 3 | 3 | 5 |
>>| 5 | 2 | 0 | 2 | 4 | 4 | 3 |
>>| 6 | 1 | 0 | 3 | 4 | 5 | 2 |
>>| 7 | 2 | 0 | 3 | 4 | 5 | 1 |
>>| 8 | 2 | 0 | 1 | 5 | 4 | 3 |
>>| 9 | 4 | 0 | 2 | 2 | 4 | 2 |
>>| 10 | 2 | 0 | 2 | 4 | 5 | 2 |
>>
>>*Final Scores*
>>| Score Type | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
>>| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
>>| raw | 18 | 28 | 27 | 28 | 33 | 32 | 28 | 27 | 30 | 23 |
>>| weighted | 23 | 34 | 36 | 34 | 44 | 38 | 37 | 37 | 31 | 30 |
>
>>***Evaluation 2 - 'Hard' mode***
>>
>>*Scores*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration |
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 | 20 | 10 | 40 | 15 | 40 | 5 |
>>| 2 | 50 | 5 | 50 | 40 | 65 | 25 |
>>| 3 | 25 | 15 | 70 | 20 | 45 | 30 |
>>| 4 | 35 | 10 | 40 | 35 | 35 | 25 |
>>| 5 | 15 | 10 | 40 | 65 | 40 | 45 |
>>| 6 | 55 | 5 | 55 | 40 | 50 | 15 |
>>| 7 | 45 | 5 | 45 | 20 | 55 | 15 |
>>| 8 | 20 | 0 | 25 | 60 | 40 | 45 |
>>| 9 | 20 | 5 | 60 | 55 | 50 | 25 |
>>| 10 | 40 | 5 | 45 | 15 | 35 | 10 |
>>
>>*Dimension weighting*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration |
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 | 2 | 0 | 2 | 4 | 5 | 2 |
>>| 2 | 4 | 0 | 2 | 4 | 4 | 1 |
>>| 3 | 2 | 0 | 1 | 4 | 3 | 5 |
>>| 4 | 3 | 0 | 2 | 3 | 3 | 4 |
>>| 5 | 2 | 0 | 2 | 3 | 5 | 3 |
>>| 6 | 2 | 0 | 3 | 5 | 4 | 1 |
>>| 7 | 2 | 0 | 3 | 4 | 5 | 1 |
>>| 8 | 3 | 0 | 1 | 4 | 5 | 2 |
>>| 9 | 4 | 0 | 2 | 3 | 3 | 3 |
>>| 10 | 2 | 0 | 2 | 4 | 5 | 2 |
>>
>>*Final Scores*
>>| Score Type | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
>>| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
>>| raw | 22 | 39 | 34 | 30 | 36 | 37 | 31 | 35 | 36 | 25 |
>>| weighted | 26 | 50 | 34 | 33 | 47 | 46 | 40 | 42 | 39 | 28 |
>
>>**Statistical analysis of different difficulties**
>>
>>To evaluate the statistical significance of our results for the NASA TLX we used the Wilxocon sign-ranked test.  We used this test on both the raw and the weighted results.  However, before carrying out the analysis, we decided that the weighted results would be the primary end-point, with the raw results being only a secondary end-point.  Further, we decided that we would require a p value of 0.10 for us to deem statistical significance - in a Wilcoxon signed-rank test with 10 data, this requires a W value of below 10.  The full analysis of the weighted results is provided below (the raw results were also analysed, but the method is the same so it is not repeated, rather only the results are given):
>>
>>*Wilcoxon sign-ranked test*
>>
>>Step 1: replace the paris of data with their difference
>>
>>| 'easy' score | 'hard' score | difference |
>>| ----- | ----- | ----- |
>>| 23 | 26 | -3 |
>>| 34 | 50 | -16 |
>>| 36 | 34 | 2 |
>>| 34 | 33 | 1 |
>>| 44 | 47 | -3 |
>>| 38 | 46 | -8 |
>>| 37 | 40 | -3 |
>>| 37 | 42 | -5 |
>>| 31 | 39 | -8 |
>>| 30 | 28 | 2 |
>>
>>Step 2: sort these differences by their absolute value, and then assign ranks to these differences accordingly
>>
>>| Difference |  Rank | Signed Rank |
>>| ---- | ---- | ---- |
>>| 1 | 1 | 1 |
>>| 2 | 2 | 2 |
>>| 2 | 3 | 3 |
>>| -3 | 4 | -4 |
>>| -3 | 5 | -5 |
>>| -3 | 6 | -6 |
>>| -5 | 7 | -7 |
>>| -8 | 8 | -8 |
>>| -8 | 9 | -9 |
>>| -16 | 10 | -10 |
>>
>>There are some ties here - ranks 2-3, 4-6 and 8-9 are the same values.  We dodge a bullet because the ties are of the same sign, so the result of the test is not affected by the way that the ties are handled.  If the ties had included ties of different signs, we would have had to use the mid-rank for all of them (as endorsed by William Conover in Journal of the American Statistical Association , Dec., 1973, Vol. 68, No. 344 (Dec., 1973), pp. 985-988).
>>
>>The positive-rank sum is 6, and the negative-rank sum is 49, and therefore a W value of 6 (the W value is simply the smaller of the positive-rank sum and the negative-rank sum).  This is well below the W value of 9 required for statistical significance.  In fact, a W value of 6 is statistically significant to a p value of 0.05.
>>
>> These results confirm that the increase in difficulty of the 'hard' mode of our game relative to the 'easy' mode is statistically significant.  
>>
>>The W value for the raw results was 0, which is good for a p value of 0.005.  This is reassuring, as it is a further indication that our 'hard' mode is meaningfully more difficult.
>
<br>

>**Evaluating the navigation pages**
>
>The first quantitative evaluation was carried out between 12/3/2023 and 14/3/2023.
>
>>***Evaluation 1***
>>
>>*Scores*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration |
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 | 10 | 5 | 15 | 30 | 45 | 55 |
>>| 2 | 25 | 5 | 20 | 25 | 65 | 70 |
>>| 3 | 15 | 10 | 10 | 20 | 40 | 35 |
>>| 4 | 10 | 10 | 10 | 45 | 30 | 55 |
>>| 5 | 15 | 0 | 20 | 20 | 45 | 80 |
>>| 6 | 25 | 15 | 5 | 30 | 65 | 85 |
>>| 7 | 5 | 5 | 5 | 20 | 30 | 75 |
>>| 8 | 15 | 10 | 15 | 45 | 40 | 40 |
>>| 9 | 20 | 0 | 10 | 10 | 50 | 35 |
>>| 10 | 20 | 0 | 5 | 15 | 45 | 65 |
>>
>>*Dimension weighting*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration |
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 | 2 | 0 | 1 | 3 | 4 | 5 |
>>| 2 | 2 | 0 | 1 | 4 | 4 | 4 |
>>| 3 | 3 | 0 | 1 | 4 | 2 | 5 |
>>| 4 | 3 | 1 | 0 | 2 | 4 | 5 |
>>| 5 | 2 | 0 | 1 | 3 | 5 | 4 |
>>| 6 | 2 | 0 | 1 | 5 | 3 | 4 |
>>| 7 | 3 | 1 | 0 | 4 | 2 | 5 |
>>| 8 | 3 | 1 | 0 | 2 | 4 | 5 |
>>| 9 | 2 | 0 | 1 | 5 | 4 | 3 |
>>| 10 | 3 | 0 | 1 | 3 | 5 | 3 |
>>
>>*Final Scores*
>>| Score Type | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
>>| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
>>| raw | 27 | 35 | 22 | 27 | 30 | 38 | 23 | 28 | 21 | 25 |
>>| weighted | 39 | 47 | 26 | 35 | 43 | 49 | 36 | 34 | 27 | 35 |
>>
>
>The second quantitative evaluation was carried out between 17/4/2023 and 19/4/2023
>>***Evaluation 2***
>>
>>*Scores*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration |
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 | 10 | 10 | 10 | 20 | 30 | 20 |
>>| 2 | 20 | 15 | 20 | 30 | 45 | 15 |
>>| 3 | 10 | 15 | 10 | 15 | 15 | 30 |
>>| 4 | 10 | 10 | 15 | 40 | 25 | 20 |
>>| 5 | 5 | 5 | 15 | 20 | 25 | 10 |
>>| 6 | 15 | 10 | 10 | 30 | 35 | 15 |
>>| 7 | 5 | 5 | 5 | 10 | 35 | 25 |
>>| 8 | 20 | 20 | 20 | 40 | 35 | 25 |
>>| 9 | 20 | 15 | 20 | 20 | 40 | 35 |
>>| 10 | 25 | 15 | 15 | 10 | 40 | 20 |
>>
>>*Dimension weighting*
>>| Participant Number | Mental demand | Physical demand | Temporal demand | Performance | Effort | Frustration |
>>| ----------- | ------- | ------- | ------- | ------- | ------- | ------- |
>>| 1 | 0 | 3 | 1 | 4 | 5 | 2 |
>>| 2 | 2 | 2 | 2 | 4 | 4 | 1 |
>>| 3 | 1 | 0 | 3 | 4 | 4 | 3 |
>>| 4 | 3 | 1 | 1 | 3 | 5 | 2 |
>>| 5 | 4 | 2 | 1 | 3 | 4 | 1 |
>>| 6 | 3 | 0 | 1 | 4 | 5 | 2 |
>>| 7 | 4 | 2 | 0 | 5 | 3 | 1 |
>>| 8 | 4 | 1 | 3 | 1 | 5 | 1 |
>>| 9 | 2 | 0 | 2 | 4 | 5 | 2 |
>>| 10 | 3 | 0 | 3 | 2 | 4 | 3 |
>>
>>*Final Scores*
>>| Score Type | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
>>| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
>>| raw | 17 | 24 | 16 | 20 | 13 | 19 | 14 | 27 | 25 | 21 |
>>| weighted | 21 | 27 | 17 | 23 | 14 | 25 | 11 | 27 | 29 | 21 |
>
>>**Statistical analysis of the navigation pages**
>>Because the methodology of the Wilcoxon signed rank test was laid out in relation to the evaluation of the difficulty levels of our game, I will not repeat it here.  The W values of this test are 1 for the weighted results, and 2.5 for the raw results (raw results had tied ranks and so the mid-tier was used).  Again, we had decided on a p value of 0.1 for statistical significance ahead of time.  Both these W values met the predetermined threshold for statistical significance.
>>
>>
>>This result is encouraging because it confirms that the changes we made to the navigation pages in our sprints over the Easter holidays made a significant, and positive impact on the usability of our game.
>>
>>
>
<br>


---

### Process
Our team worked together effectively throughout the design process.  We used [Kanban boards](ReportMaterial/KanbanBoards) to keep a track of the outstanding tasks (We used Atlassian to host these, but saved PDFs of the board at various stages of development for our report). We used GitHub to host our work, as was required by the unit.  However, the way we used it developed throughout the project.

Throughout the project we continually delegated tasks between ourselves. We used WhatsApp to stay connected and updated with any changes or concerns we ran into through the development process. This allowed us to address anything which was a "quick fix" over message without the need to organise a scheduled team meeting. We found this helped us work efficiently and with a greater degree of freedom. However, this meant that sometimes our Kanban boards got quite out of sync with what needed doing at any given time as we would organise ourselves over WhatsApp. Reflecting on this — for future projects we thought it would be worth designating someone to be in charge of updating and maintaining the Kansan boards so that everyone has access to a clear view of what needs doing and which tasks have been assigned to which person.

We had a game-jam in reading week.  This was a whole-day affair, and was the first significant chunk of time we spent as a team developing the game.  While we were using GitHub to keep a track of our changes, we ran into problems because we had not formalised an agreed-upon workflow.  Therefore, no-one was using branches.  Rather we we committing straight to 'main', or even dropping files directly into the GitHub repo via the gui.  This lead to the situation where people were making great features on their local copy of the repo, but that this was completely different to everyone else's local copy.  Therefore, even though we had managed to make a minimum-viable-product locally, this was not reflected on the GitHub, and took a lot of work to fix (many thanks to Ollie, the TA for helping us untangle the knots).  Fortunately, we were able to recover our work, and this mishap prompted us to use a standardised Git workflow.  Everyone had a personal branch.  When they were ready with a feature, they had to checkout their local main, pull from origin, checkout their personal branch, merge with main, and only when all conflicts were resolved could they push.  When pushed they had to make a pull request to get their changes into main.  This system worked for us, and we didn't have any other Git mishaps.

We split up different features between ourselves so that we could work independently. Though, during our game-jam we found the practice of pair-programming helpful to get started on setting up the foundations of the game. Working together in one room allowed us to talk about and share code so that we all understood and were in agreement about what the first key features of the game should be.

We found that meeting up in person was an invaluable tool through the development process. We would meet for a short period of time after our Software Engineering lab to check in on the project and make sure we all knew what the next sections to focus on were. The regularity of the lab was helpful as other deadlines and work meant that there were periods where we were all busy with different things. The lab meetings allowed us to catch-up and chat about how we were finding the project and whether we needed help with any sections. We tried to find a work schedule that worked for all of us: according to the project timetable laid out at the beginning of term weeks 8 and 9 should have resulted in the evaluation section of the report being done. During this time we had several overlapping deadlines for other courses so as a team we decided that this work should be split up between us for the first week of the Easter break to give us a chance to complete our other work to a high standard. We thought that this practice of assessing upcoming challenges with workflow in advance to address problems before they occur was very successful and would definitely employ this technique for future projects.

---

### Conclusion
We learned a lot during this process about the use and application of different development techniques. Reflecting on the process, we managed the evaluation section of development well and by using a wide range of techniques we gained valuable insight into the state of our game at each moment and clear direction about where we needed to focus our efforts. Our game changed radically throughout the process and many of the design specifics that made sense to us as we progressed were not ideas we came up with initially. We thoroughly benefited from the flexibility of the agile development cycles. For future projects we think that it will be worth taking into consideration other projects and deadlines that the team have at the beginning of the development process. We overestimated the amount we could get done in some weeks and underestimated in others. This was not a huge problem as we had time to make adjustments to our plans and reallocate work throughout however on a larger project we think this is definitely something to consider.


If we had the time and resources to develop the game further the next immediate features we would want to add are: a universal leaderboard, multiple levels and independent lives for multiplayer games. If we were to go even further then we would want to expand the story so that each level contributes to the overall plot and add items that you can collect and use throughout the levels.


### Individual contribution:

Alexander Cockrean: 1.00

Zoe Clark: 1.00

Leon Chen: 1.00

Li Hanyu: 1.00

ZYJ: 1.00
