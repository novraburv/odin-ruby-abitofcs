# frozen_string_literal: true

def fibs(len)
  a = [0, 1]
  return a[0..len] if len <= 2

  a << a[-1] + a[-2] while a.length < len
  a
end

def fibs_rec(len, arr = [0, 1])
  return arr[0...len] if len <= 2

  fibs_rec(len - 1, arr << arr[-1] + arr[-2])
  arr
end

# test fibonacci
p 'FIBONACCI'
p fibs 8
p fibs_rec 8
puts ''
