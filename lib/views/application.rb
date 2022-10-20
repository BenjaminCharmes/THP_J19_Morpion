class Application
  attr_accessor :game_nb, :score_player1, :score_player2

  def initialize
    @players = Array.new
    @game_nb = 0
    @score_player1 = 0
    @score_player2 = 0
    system 'clear'
    puts
    puts "     XOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXO     ".colorize(:green)
    puts "     O                                      X     ".colorize(:green)
    puts "     X   👾   Welcome to tic-tac-toe   👾   O     ".colorize(:green)
    puts "     O                                      X     ".colorize(:green)
    puts "     XOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXO     ".colorize(:green)
    puts
    sleep(1)
    puts "What is the name of the first player ?"
    puts
    print "🖍  > "
    player1_name = gets.chomp
    @players << Player.new(player1_name.colorize(:blue), "o".colorize(:blue))
    puts
    puts "What is the name of the second player ?"
    puts
    print "🖍  > "
    player2_name = gets.chomp
    @players << Player.new(player2_name.colorize(:red), "x".colorize(:red))
    puts
    puts "Let's play ! 👾".colorize(:green)
    sleep(2)
    continue = true
    while continue == true
      game = Game.new
      while game.is_game_over? == false
        # Player1
        game.play_a_round(@players[0])
        game.is_x_win?
        game.is_board_full?
        game.is_game_draw?
        game.is_game_over?
        if game.is_game_over? == true
          break
        end

        # Player2
        game.play_a_round(@players[1])
        game.is_o_win?
        game.is_board_full?
        game.is_game_draw?
        game.is_game_over?
      end
      if game.is_o_win? == true
        @score_player1 += 1
        puts
        puts "Congratulation ! #{@players[0].name} you win ! 🏆"
        sleep(1)
        puts
        puts "#{@players[1].name} you loose ! 😒"
        sleep(2)
      elsif game.is_x_win? == true
        @score_player2 += 1
        puts
        puts "Congratulation ! #{@players[1].name} you win ! 🏆"
        sleep(1)
        puts
        puts "#{@players[0].name} you loose ! 😒"
        sleep(2)
      elsif game.is_game_draw? == true
        puts
        puts "It's a draw ! 🤷"
        sleep(2)
      end
      @game += 1
      puts
      puts "Want to play again ? 🎲"
      print "Enter: "
      print "y".green
      print " or "
      puts "n".red
      print "🖍  > "
      continue_test = gets.chomp
      if continue_test == "y"
        continue = true
      else
        continue = false
        puts
        puts "Thanks for playing ! 🤩"
        sleep(1)
        puts
        puts "See you soon ! 👋"
        sleep(3)
        system 'clear'
      end
    end 
  end 

end