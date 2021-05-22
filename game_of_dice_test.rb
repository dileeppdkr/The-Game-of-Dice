# game_of_dice_test.rb
require "test/unit"
require_relative './game_of_dice'

class GameOfDiceTest < Test::Unit::TestCase
    class << self
        def startup
            puts "*"*30
            puts "Welcome to Game of Dice!"
            @N = 4
            puts "Total Number of players #{@N}"
            puts ''
            @M = 30
            puts "Game will end once a player reaches #{@M} points"
            @players = {}
            @consecutive_once = {}
            (1..(@N).to_i).each do |player|
                @players["player_#{player}"] = 0
                @consecutive_once["player_#{player}"] = 0
            end
            puts @players
            puts ("Let's roll those die!")
            puts ""
        end
    end

    test "Roll the dice and get a random numeric number" do
        res = GameOfDice.new.dice_roll
        assert_equal(true, res.is_a?(Numeric))
    end

  end