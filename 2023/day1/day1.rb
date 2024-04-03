
def main(f)
  file = File.open(f)
  file_data = file.readlines.map(&:chomp)
  line_values = []

  file_data.each do |d|
    line_val = get_number(d)
    line_values.push(line_val)
  end

  total = line_values.sum
  puts total
end

def string_is_integer?(str)
  Integer(str)
  true
rescue ArgumentError
  false
end

def get_number(text)
  text_to_num = {
    'one' => "1",
    'two' => "2",
    'three' => "3",
    'four' => "4",
    'five' => "5",
    'six' => "6",
    'seven' => "7",
    'eight' => "8",
    'nine' => "9",
  }
  target_number = ''

  for i in 0...text.length
    char = text[i]
    if string_is_integer?(char) 
      first_number = char
    else
      text_to_num.each do |key, value|
        if text[i..-1].start_with?(key)
          first_number = value 
        end
      end
    end
    if first_number
      break
    end
  end

  reversed_text = text.reverse

  reversed_text_to_num = text_to_num.reduce({}) do |new_hash, (k,v)|
    reversed_k = k.reverse
    new_hash[reversed_k] = v
    new_hash
  end

  for i in 0...reversed_text.length
    char = reversed_text[i]
    if string_is_integer?(char) 
      last_number = char
    else
      reversed_text_to_num.each do |key, value|
        if reversed_text[i..-1].start_with?(key)
          last_number = value 
        end
      end
    end
    if last_number 
      break
    end
  end

  target_number = first_number + last_number
  target_number.to_i
end

main("input.txt")