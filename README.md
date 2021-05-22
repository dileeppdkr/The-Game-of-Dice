# The-Game-of-Dice
The "Game of Dice" is a multiplayer game where N players roll a 6 faced dice in a round-robin fashion. Each time a player rolls the dice, their points increase by the number (1 to 6) achieved by the roll.
As soon as a player accumulates M points they complete the game and are assigned a rank. Remaining players continue to play the game till they accumulate at least M points. The game ends when all players have accumulated at least M points.
Rules of the Game

* The order in which the users roll the dice is decided randomly at the start of the game.
* If a player rolls the value "6" then they immediately get another chance to roll again and
move ahead in the game.
* If a player rolls the value "1" two consecutive times then they are forced to skip their next
turn as a penalty.


Things you may want to cover:

* Ruby version
    Install ruby (Any version)
    https://www.ruby-lang.org/en/documentation/installation/

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
    ruby game_od_dice_test.rb
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## To run the program and launch the shell (Interactive shell): 
	bin/start_game
	
#Input & Output:
	
	
	Please enter Players count
	3
	Total Number of players 3
	Enter points of accumulate
	10
	Game will end once a player reaches 10 points
	Let's roll those die!
	"Round 1"
	"********************"
	player_1 its your turn (press ‘r’ to roll the dice)
	r
	roll result --- 1
	****** Scores ******
	player_1 - 1
	player_2 - 0
	player_3 - 0
	player_2 its your turn (press ‘r’ to roll the dice)
	r
	roll result --- 1
	****** Scores ******
	player_1 - 1
	player_2 - 1
	player_3 - 0
	player_3 its your turn (press ‘r’ to roll the dice)
	r
	roll result --- 5
	****** Scores ******
	player_3 - 5
	player_1 - 1
	player_2 - 1
	
	"Round 2"
	"********************"
	player_1 its your turn (press ‘r’ to roll the dice)
	r
	roll result --- 6
	****** Scores ******
	player_1 - 7
	player_3 - 5
	player_2 - 1
	Woohoo! player_1 You got another chance to roll the dice
	player_1 its your turn (press ‘r’ to roll the dice)
	r
	roll result --- 3
	****** Scores ******
	player_1 - 10
	player_3 - 5
	player_2 - 1
	player_1 completes the game with 1'st Rank
	player_2 its your turn (press ‘r’ to roll the dice)
	r
	roll result --- 3
	****** Scores ******
	player_3 - 5
	player_2 - 4
	player_3 its your turn (press ‘r’ to roll the dice)
	r
	roll result --- 1
	****** Scores ******
	player_3 - 6
	player_2 - 4

	"Round 3"
	"********************"
	player_2 its your turn (press ‘r’ to roll the dice)
	r
	roll result --- 1
	****** Scores ******
	player_3 - 6
	player_2 - 5
	player_3 its your turn (press ‘r’ to roll the dice)
	r
	roll result --- 6
	****** Scores ******
	player_3 - 12
	player_2 - 5
	player_3 completes the game with 2'st Rank
	********* Final Ranking **********
	player_1 Rank 1
	player_3 Rank 2
	player_2 Rank 3
	**********************************
	N
	Thank you for playing.
		


		
