def main(f)
  # read each line of the file
  # find how many of each by finding a number, then next word is the color to assign it. match on the word, then go again to find the next number
  # if game is possible, add its id to possible games sum
  def string_is_integer?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end 

  pattern = /(red|green|blue)/

  file = File.open(f)
  game_data = file.readlines.map(&:chomp)

  valid_game_sum = 0

  def draw_is_valid?(totals)
    if totals['red'] <= 12 && totals['green'] <= 13 && totals['blue'] <= 14
      true
    else
      false
    end
  end

  game_data.each do |l|
    game_is_valid = true

    if l[6] == ":"
      game_id = l[5]
      starting_point = 7
    elsif l[7] == ":"
      game_id = l[5..7] 
      starting_point = 8
    else 
      game_id = l[5..8]
      starting_point = 9
    end


    draws = l[starting_point...l.length].split(";")

    draws.each do |d|

      color_totals = {
        'blue' => 0,
        'green' => 0,
        'red' => 0
      }
      for i in 0...d.length
        char = d[i]
        next_char = d[i+1]
        previous_char = d[i-1]
        increment = 0
        
        if string_is_integer?(char)
          if string_is_integer?(next_char) and !string_is_integer?(previous_char)
            increment = d[i..i+1]
          else
            increment = d[i]
          end
  
          substring = d[i...d.length]
          match_data = substring.match(pattern)
          color = match_data[0]
          color_totals[color] = increment.to_i
        end

        if !draw_is_valid?(color_totals)
          game_is_valid = false
          break
        end
      end

      if !game_is_valid
        break
      end
    end

    if game_is_valid
      valid_game_sum += game_id.to_i
    end


  end
  puts "valid games sume"
  puts valid_game_sum
end

main("input.txt")