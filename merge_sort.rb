def merge_sort(array)
  if array.size > 2
    sorted_array = []
    first = merge_sort(array[0..(array.size/2 - 1)])
    second = merge_sort(array[array.size/2..-1])
    while not(first.empty?) && not(second.empty?)
      if first[0] < second[0]
        sorted_array << first[0]
        first.shift
      else
        sorted_array << second[0]
        second.shift
      end
    end
    first.empty? ? sorted_array += second : sorted_array += first
    return sorted_array
  end
  if array.first > array.last
    array[0], array[1] = array[1], array[0]
  end
  return array
end



p merge_sort([14, 18, 20, 16, 15])
