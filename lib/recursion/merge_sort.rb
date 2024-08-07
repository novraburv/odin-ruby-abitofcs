# frozen_string_literal: true

def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = merge_sort arr[0...mid]
  right = merge_sort arr[mid...]

  merge(left, right)
end

def merge(left, right)
  result = []
  while left.any? && right.any?
    result << if left.first < right.first
                left.shift
              else
                right.shift
              end
  end
  result + left + right
end

# test merge sort
x1 = [3, 2, 1, 13, 8, 5, 0, 1]
x2 = [105, 79, 100, 110]
x3 = Array(0...rand(25)).shuffle

p 'MERGE_SORT'
p merge_sort(x1)
p merge_sort(x2)
p merge_sort(x3)
puts ''
