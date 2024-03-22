with open('./input.txt', 'r') as f:
  def get_numbers(text: str):
    target_num = ''

    for c in text:
      if (c.isdigit()):
        target_num += c
    
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
