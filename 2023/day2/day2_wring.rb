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

  def game_is_valid?(totals)
    if totals['red'] <= 12 && totals['green'] <= 13 && totals['blue'] <= 14
      true
    else
      false
    end
  end

  game_data.each do |l|
    color_totals = {
      'blue' => 0,
      'green' => 0,
      'red' => 0
    }

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

    for i in starting_point...l.length
      char = l[i]
      next_char = l[i+1]
      previous_char = l[i-1]
      increment = 0
      
      if string_is_integer?(char)
        if string_is_integer?(next_char) and !string_is_integer?(previous_char)
          increment = l[i..i+1]
        else
          increment = l[i]
        end

        substring = l[i...l.length]
        match_data = substring.match(pattern)
        color = match_data[0]
        color_totals[color] += increment.to_i
      end
    end

    if game_is_valid?(color_totals)
      puts "valid game:"
      puts game_id
      valid_game_sum += game_id.to_i
    end
  end
  puts "valid games sume"
  puts valid_game_sum
end

main("input.txt")