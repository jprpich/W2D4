require 'byebug'

# time complexity is Quadratic O(n^2)
def my_min(arr)
  min = arr.first
  arr.each_with_index do |el1, i|
    smallest = true 
    arr.each_with_index do |el2, j|
      if el1 > el2    
        smallest = false
      end
    end
    if smallest
      min = el1
      smallest = true
    end
  end
  min
end

# time complexity is Linear O(n)
def my_min2(arr)
  i = 0
  min = arr[i]
  while i < (arr.length - 1)
    if (arr[i+1] < min)
      min = arr[i+1]
    end
    i += 1
  end
  min 
end


# list = [ 0, 3, 5, 4, -5, 10, 1 ]
# p my_min2(list)  # =>  -5

# time complexity is Quadratic O(n^2)
def largest_contiguous_subsum(arr)
  start = Time.now
  sub_array = []

  arr.each_with_index do |ele, i|
    arr.each_with_index do |ele2, i2|
      sub_array << arr[i..i2] unless arr[i..i2].empty?
    end
  end
  # max = sub_array[0].reduce(:+)
  # sub_array.each do |ele|
  #   sum = ele.reduce(:+)
  #   max = sum if sum > max
  # end
  # max
  sub_array.map { |ele| ele.reduce(:+)}.sort.last 
  finish = Time.now
  diff = finish - start
  p diff
  
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

# loop once O(n)       

def largest_contiguous_subsum2(arr)
  start = Time.now
# code to time



  return arr.max if arr.none? { |ele| ele >= 0 }
 
  largest = arr.first
  current = arr.first
  arr.drop(1).each do |ele|
    current += ele
    current = 0 if current < 0
    if current > largest
      largest = current
    end
  end
  largest
  finish = Time.now
  diff = finish - start
  p diff
  
  
end
# list = (0..2000).to_a
# largest_contiguous_subsum2(list) # => 8
# largest_contiguous_subsum(list)
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])
# list = [-5, -1, -3]
# p largest_contiguous_subsum2(list) # => -1 (from [-1])


#We have no idea of time complexity due to the use of #permutation method... but it's long.
def first_anagram?(str1, str2)
  chars = str1.chars.permutation.to_a
  chars.each do |subchar|
    return true if str2 == subchar.join
  end
  false

end


def second_anagram?(str1, str2)
  arr1 = str1.chars 
  arr2 = str2.chars 
  arr1.each do |char|
    return false unless arr2.index(char)
    found_index = arr2.index(char)
    first_half = str2[0...found_index]
    second_half = str2[found_index+1..-1]
    word = first_half + second_half
    arr2.delete(word)
  end
  arr2.empty?
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
# p second_anagram?("supercalifragilisticexpialidocious", "upercalifragilisticexpialidociouss")






