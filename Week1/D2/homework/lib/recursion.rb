def sum_to(n)
  return nil if n < 0
  return 0 if n == 0
  sum_to(n-1) + n
end

def add_numbers(numbers)
  return nil if numbers.length < 1
  return numbers[0] if numbers.length == 1
  add_numbers(numbers[0..-2]) + numbers[numbers.length-1]
end

def gamma_fnc(gamma)
  return nil if gamma < 1
  return 1 if gamma == 1
  gamma_fnc(gamma - 1) * (gamma - 1)
end

def ice_cream_shop(selection, palate)
  return false if selection == []
  return true if selection[-1] == palate
  ice_cream_shop(selection[0..-2], palate)
end

def reverse(string)
  return "" if string.length == 0
  reverse(string[1..-1]) + string[0]
end
