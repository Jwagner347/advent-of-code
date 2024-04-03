import re
with open('./input.txt', 'r') as f:
  text_to_num = {
    'one' : 1,
    'two' : 2,
    'three' : 3,
    'four' : 4,
    'five' : 5,
    'six' : 6,
    'seven' : 7,
    'eight' : 8,
    'nine' : 9,
    'zero' : 0
  }

  def convert_text_numbers(s):
    pattern = re.compile('|'.join(text_to_num.keys()))
    
    def replace_func(match):
     return text_to_num[match.group(0).lower()]

    return pattern.sub(replace_func, s)

  def get_numbers(text: str):
    target_num = [] 
    text_num = ''
    for c in text:

    for c in text:
      if (c.isdigit()):
        target_num += c
      else:
        
    
    first_number = target_num[0] if target_num[0] else ''
    last_number = target_num[len(target_num)-1]

    target_num = first_number + last_number
    return int(target_num)

  line_vals = []
  for line in f:
    line_val = get_numbers(line.strip())
    line_vals.append(line_val) 
    print(line.strip())

  print(sum(line_vals))
