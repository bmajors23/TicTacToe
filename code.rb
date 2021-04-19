require_relative "classes"

$board = "
_1_|_2_|_3_
_4_|_5_|_6_
 7 | 8 | 9
"

$unused_numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

def place_key(number, key)
    go = true
    while go
        if $unused_numbers.include?(number.strip)
            go = false
            $unused_numbers.delete(number.strip)
            return $board.gsub(number.strip, key.strip)
        else
            puts "Please enter a valid number."
            number = gets
        end
    end
end

def check_win(selections)
    if selections.include?("1")
        if selections.include?("4")
            if selections.include?("7")
                return true
            end
        end
        if selections.include?("2")
            if selections.include?("3")
                return true
            end
        end
        if selections.include?("5")
            if selections.include?("9")
                return true
            end
        end
    elsif selections.include?("2")
        if selections.include?("5")
            if selections.include?("8")
                return true
            end
        end
    elsif selections.include?("3")
        if selections.include?("6")
            if selections.include?("9")
                return true
            end
        end
        if selections.include?("5")
            if selections.include?("7")
                return true
            end
        end
    elsif selections.include?("4")
        if selections.include?("5")
            if selections.include?("6")
                return true
            end
        end
    elsif selections.include?("7")
        if selections.include?("8")
            if selections.include?("9")
                return true
            end
        end
    else
        return false
    end
end

puts "Let's play Tic Tac Toe!"
puts $board

puts "\nWhat is your name player 1?"
username = gets
player_1 = Player.new(username)

puts "What is your name player 2?"
username_2 = gets
player_2 = Player.new(username_2)

running = true
while running
    puts "Where would you like to place your #{player_1.key.strip} #{player_1.username.strip}?"
    placement = gets
    $board = place_key(placement, player_1.key)
    puts $board
    player_1.chosen_numbers.append(placement.strip)
    if check_win(player_1.chosen_numbers)
        puts "#{player_1.username.strip} wins!"
        running = false
        break
    end
    if $unused_numbers.empty?
        running = false
        break
    end
    puts "Where would you like to place your #{player_2.key.strip} #{player_2.username.strip}?"
    placement = gets
    $board = place_key(placement, player_2.key)
    puts $board
    player_2.chosen_numbers.append(placement.strip)
    if check_win(player_2.chosen_numbers)
        puts "#{player_2.username.strip} wins!"
        running = false
        break
    end
end

puts "Game over!"