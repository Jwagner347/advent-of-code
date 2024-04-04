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
  power_additions = 0

  def draw_is_valid?(totals)
    if totals['red'] <= 12 && totals['green'] <= 13 && totals['blue'] <= 14
      true
    else
      false
    end
  end

  game_data.each do |l|
    game_is_valid = true
    fewest_game_cubes = {
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
        num_cubes = 0
        
        if string_is_integer?(char)
          if string_is_integer?(next_char) and !string_is_integer?(previous_char)
            num_cubes = d[i..i+1]
          else
            num_cubes = d[i]
          end
  
          substring = d[i...d.length]
          match_data = substring.match(pattern)
          color = match_data[0]
          if game_id == "3" and color == "green"
            puts "num_cubes"
            puts num_cubes
          end
          num_cubes = num_cubes.to_i
          color_totals[color] = num_cubes
          if fewest_game_cubes[color].to_i < num_cubes
            fewest_game_cubes[color] = num_cubes
          end
        end

      end

    end

    if game_is_valid
      valid_game_sum += game_id.to_i
    end

    game_power = fewest_game_cubes.values.inject(1) { |result, v| result * v }
    power_additions += game_power
    puts "minimum cubes for game " + game_id
    puts fewest_game_cubes

  end
  puts "valid games sume"
  puts valid_game_sum
  puts "power_additions:"
  puts power_additions
end

main("input.txt")