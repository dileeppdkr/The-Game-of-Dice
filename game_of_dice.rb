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
        generate_players
        # puts @players
        puts ("Let's roll those die!")
        puts ""
    end

    def generate_players
        (1..(@N).to_i).each do |player|
            @players["player_#{player}"] = 0
            @consecutive_once["player_#{player}"] = 0
        end
    end

    def dice_roll
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
            res = dice_roll
            if res == 1
                @consecutive_once["#{player}"] = @consecutive_once["#{player}"] + 1
            else
                @consecutive_once["#{player}"] = @consecutive_once["#{player}"] > 0 ? @consecutive_once["#{player}"] - 1 : 0
            end
            puts "roll --- #{res}"
            total = v + res
            @players["#{player}"] = total
            puts "****** Scores ******"
            all_players = @players.sort_by {|k, v| -v}
            all_players.each do |plr,value|
                puts "#{plr} - #{value}"
            end

            if total >= @M.to_i
                puts "#{player} won the game"
                playAgain
            end
            if res == 6
                puts "Woohoo! #{player} You got another chance to roll the dice"
                play_game(player,total) 
            end
        else
            puts "Wong Input #{roll}"
            play_game(player,v)
        end
    end

    def start_game
        rounds = 1
        while true
            puts ''
            p ("Round #{rounds}")
            p "*"*20
            rounds += 1
            @players.each do |player,v|
                play_game(player,v)
            end
        end

    end

    def playAgain
        puts "Would you like to start over? (Y/N)\n"
        answer = gets.chomp.upcase
        if answer == "Y"
            generate_players
            start_game
        elsif answer == "N"
            puts "Thank you for playing.\n"
            exit
        else
            playAgain
        end    
    end
end

GameOfDice.new.start_game