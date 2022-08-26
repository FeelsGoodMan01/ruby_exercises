require 'pry-byebug'
def bubble_sort (array)
    swaps = true
    (array.size - 1).times do |i|
        swaps = false 
        array[0..-(i+2)].each_index do |index|
            if array[index] > array[index+1]
                array[index], array[index+1]  = array[index+1], array[index]
                swaps = true
            end
        end
        unless swaps
            p array
            puts "Sorted in #{i} iterations!"
            return array
        end
    end
    p array
    puts "Sorted in #{array.size - 1} iterations!"
    return array
end

a = [4,3,78,2,0,2]

bubble_sort(a)

# [3,4,2,0,2,78] - 1
# [3,2,0,2,4,78] - 2
# [2,0,2,3,4,78] - 3
# [0,2,2,3,4,78] - 4
