require_relative 'board'
require_relative 'ship'
require_relative 'cell'


class Battleship

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships = []
    @computer_ships = []
  end

  def run
    puts "Welcome to BATTLESHIP"
    loop do
      main_menu
      break if game_ends?
    end
      puts "Goodbye!"
  end

  def main_menu
    puts "Enter 'p to play. Enter 'q' to quit."
    choice = gets.chomp.downcase
    case choice
    when 'p'
      setup_game
      play_game
    when 'q'
      exit
    else 
      puts "You were ordered to enter 'p' or 'q' soldier. GET TO IT!"
    end  
  end


  def setup_game
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @computer_ships = computer_ship_placement(cruiser, submarine)
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    place_player_ships
  end

  def computer_ship_placement(cruiser, submarine)
    cruiser_coordinates = generate_random_coordinates(cruiser.length)
    submarine_coordinates = generate_random_coordinates(submarine.length)

    @computer_board.place(cruiser, cruiser_coordinates)
    @computer_board.place(submarine, submarine_coordinates)

  end

  def generate_random_coordinates

  end

  def place_player_ships
  
  end

  def play_game

  end

  # def player_turn

  # end

  # def computer_turn

  # end

  def game_ends?

    player_ships_sunk? || computer_ships_sunk?

  end
end


game = Battleship.new
game.run





# Make Main Menu
  # Greet User - "Welcome to Battleship"
    #         "To start a new game - enter 'P' "
    #             "To quit - enter 'Q' "
    #         
    #           "For a Dad Joke - enter 'DJ' "

    #####################################################

    # (Add asci art for Main Menu)
    ### If player enters anything besides P, Q, or DJ -> prompt to try again
    # Player returns to Main Menu after game end

# Setup
  # Computer places ships (behind the scenes)
    # Use randomization but use It.2 placement rules

# Prompt Player to place ships with instructions
  # Show empty gameboard for visual aid
    # Follow It.2 placement rules

      # DISPLAY TO TERMINAL FOR PLAYER

      # "I have laid out my ships on the grid.""
      # "You now need to lay out your two ships."

# The Cruiser is three units long and the Submarine is two units long.
#   1 2 3 4
# A . . . .
# B . . . .
# C . . . .
# D . . . .

# "To correctly place a ship on the board, 
# please enter your desired grid coordinates 
# starting with the letter first, 
# followed by the number."

# For example: A3 B3 C3

# Enter the squares for the Cruiser (3 spaces):
# >
# When the user enters a valid sequence of spaces, the ship should be placed on the board, 
# the new board with the ship should be shown to the user, and then the user should be asked to place the other ship.

# Enter the squares for the Cruiser (3 spaces):
# > A1 A2 A3

#   1 2 3 4
# A S S S .
# B . . . .
# C . . . .
# D . . . .
# Enter the squares for the Submarine (2 spaces):
# >
# If the user enters an invalid sequence, they should be prompted again:

# Enter the squares for the Submarine (2 spaces):
# > C1 C3
# Those are invalid coordinates. Please try again:
# > A1 B1
# Those are invalid coordinates. Please try again:
# > C1 D1
# The Turn
# During the main game, players take turns firing at one another by 
# selecting positions on the grid to attack.

# A single turn consists of:

# Displaying the boards
# Player choosing a coordinate to fire on
# Computer choosing a coordinate to fire on
# Reporting the result of the Player’s shot
# Reporting the result of the Computer’s shot
# Displaying the Boards
# At the start of the turn, the user is shown both boards. The user should 
# see their ships but not the computer’s ships:

# =============COMPUTER BOARD=============
#   1 2 3 4
# A M . . M
# B . . . .
# C . . . .
# D . . . .
# ==============PLAYER BOARD==============
#   1 2 3 4
# A S S S .
# B . M . .
# C M . S .
# D . . S .

# Player Shot
# The player should be asked for a coordinate to fire on. If they enter an 
# invalid coordinate, they should be prompted until they enter a valid one:

# Enter the coordinate for your shot:
# > D5
# Please enter a valid coordinate:
# > Z1
# Please enter a valid coordinate:
# > A4
# Computer Shot
# The computer should choose a random space on the board. The computer should 
# not fire on a space that has already been fired on.

# Results
# The results of the shots should be displayed:

# Your shot on A4 was a miss.
# My shot on C1 was a miss.
# The game needs to handle all of the following results:

# A shot missed
# A shot hit a ship
# A shot sunk a ship
# Coordinates that have already been fired upon
# It is possible that the user enters a coordinate they have already fired upon. 
  # You need to add something that informs the user that this is the case. 
    # You may choose to either prompt them again for a coordinate they haven’t 
      # fired on, or let them choose it again and inform them in the results phase that 
        # they selected this coordinate again.

# End Game
# The game is over when either the computer or the user sinks all of the enemy ships. 
# When this happens, the user should see a message stating who won:

# You won!
# or

# I won!
# Then, they should be returned to the Main Menu asking them if they 
# would like to play or quit.

# Functionality Checklist
# This checklist summarizes all of the functionality you are expected to build. 
# This will be used to assess the completion of your project:

# Main Menu:

# User is shown the main menu where they can play or quit
# Setup:

# Computer can place ships randomly in valid locations
# User can enter valid sequences to place both ships
# Entering invalid ship placements prompts user to enter valid placements
# Turn:

# User board is displayed showing hits, misses, sunken ships, and ships
# Computer board is displayed showing hits, misses, and sunken ships
# Computer chooses a random shot
# Computer does not fire on the same spot twice
# User can choose a valid coordinate to fire on
# Entering invalid coordinate prompts user to enter valid coordinate
# Both computer and player shots are reported as a hit, sink, or miss
# User is informed when they have already fired on a coordinate
# Board is updated after a turn
# End Game:

# Game ends when all the user’s ships are sunk
# Game ends when all the computer’s ships are sunk
# Game reports who won
# Game returns user back to the Main Menu