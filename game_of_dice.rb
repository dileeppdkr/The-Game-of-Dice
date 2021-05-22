class GameOfDice

    def initialize
        puts "*"*30
        puts "Welcome to Game of Dice!"
        puts "Please enter Players count"
        @N = gets.chomp.to_i if !@N
        if !@N.is_a?(Numeric) || @N <= 0
            puts "Enter a numeric value which is grater than 0"
            exit
        end
        puts "Total Number of players #{@N}"
        puts ''
        puts "Enter points of accumulate"
        @M = gets.chomp.to_i if !@M
        if !@M.is_a?(Numeric) || @M <= 0
            puts "Enter a numeric value which is grater than 0"
            exit
        end
        puts "Game will end once a player reaches #{@M} points"
        @players = {}
        @consecutive_once = {}
        @completed_players = {}
        generate_players
        puts ("Let's roll those die!")
        puts ""
    end
    # create a players and consecutive_once object to verify on every round
    def generate_players
        (1..(@N).to_i).each do |player|
            @players["player_#{player}"] = 0
            @consecutive_once["player_#{player}"] = 0
        end
    end

    def dice_roll
        # generate random number from 1 to 6
        Random.new.rand(1..6)
    end

    def play_game player,v
        # If a player rolls the value "1" two consecutive times then they are forced to skip their next turn as a penalty.
        if @consecutive_once["#{player}"] >= 2
            puts "#{player} skipped because of two consecutive 1's "
            @consecutive_once["#{player}"] = 0
            return true
        end
        puts "#{player} its your turn (press ‘r’ to roll the dice)"
        roll = gets.chomp
        if roll == 'r'
            # dice the roll
            res = dice_roll
            # updating consecutive_once in case a player rolls the value "1" two consecutive times
            if res == 1
                @consecutive_once["#{player}"] = @consecutive_once["#{player}"] + 1
            else
                @consecutive_once["#{player}"] = @consecutive_once["#{player}"] > 0 ? @consecutive_once["#{player}"] - 1 : 0
            end
            puts "roll result --- #{res}"
            total = v + res
            @players["#{player}"] = total
            puts "****** Scores ******"
            all_players = @players.sort_by {|k, v| -v}
            all_players.each do |plr,value|
                puts "#{plr} - #{value}"
            end
            # verify if the player reached accumulate points and exit from game
            if total >= @M.to_i
                len = @completed_players.size
                @completed_players["#{player}"] =  len + 1
                puts "#{player} completes the game with #{@completed_players.size}'st Rank"
                @all_players.delete("#{player}")
                if  @completed_players.size == @N -1
                    key,value = @all_players.first
                    @completed_players["#{key}"] = @N
                    playAgain
                end
            end
            # If a player rolls the value "6" then they immediately get another chance to roll again and move ahead in the game.
            if res == 6
                puts "Woohoo! #{player} You got another chance to roll the dice"
                play_game(player,total) if @all_players.has_key?(player)
            end
        else
            # wrong input other than r
            puts "Wong Input #{roll}"
            play_game(player,v)
        end
    end

    def start_game
        rounds = 1
        @all_players = @players
        # continue game until finish all players
        while true
            puts ''
            # Print the round which players are playing
            p ("Round #{rounds}")
            p "*"*20
            rounds += 1
            
            @all_players.each do |player,v|
                play_game(player,v)
            end
        end

    end
    # if user want's to play again
    def playAgain
        #print final ranking order of a players
        puts "********* Final Ranking **********"
        @completed_players.each do |k,v|
            puts "#{k} Rank #{v}"
        end
        puts "**********************************"
        @completed_players = {}
        # if players want to continue again
        puts "Would you like to start over? (Y/N)\n"
        answer = gets.chomp.upcase
        if answer == "Y"
            @players = {}
            # generate new set of players - destroy old data
            generate_players
            start_game
        elsif answer == "N"
            # exit in case they don't want to proceed
            puts "Thank you for playing.\n"
            exit
        else
            # repeat if user types other than Y/N
            playAgain
        end    
    end
end

#start the game
GameOfDice.new.start_game