# https://www.interviewcake.com/question/ruby/merge-sorted-arrays?section=array-and-string-manipulation&course=fc1

# O(n) time, O(n) space
def merge_sorted_arrays(arr1, arr2)
  # assumes values in arr1 and arr2 are unique
  merged_arr = []

  arr1_pointer = 0
  arr2_pointer = 0

  while arr1_pointer < arr1.length || arr2_pointer < arr2.length
    if arr2_pointer == arr2.length || (arr1_pointer != arr1.length && arr1[arr1_pointer] < arr2[arr2_pointer])
      merged_arr << arr1[arr1_pointer]
      arr1_pointer += 1
    elsif arr1_pointer == arr1.length || (arr2_pointer != arr2.length && arr2[arr2_pointer] < arr1[arr1_pointer])
      merged_arr << arr2[arr2_pointer]
      arr2_pointer += 1
    end
  end

  p merged_arr
end

merge_sorted_arrays([3, 4, 6, 10, 11, 15],[1, 5, 8, 12, 14, 19]) # [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
merge_sorted_arrays([3, 4, 6, 10, 11, 15, 452],[1, 5, 8, 12, 14, 19, 50, 100, 159, 253])
merge_sorted_arrays([3],[1])
merge_sorted_arrays([],[])
merge_sorted_arrays([3,4],[])
merge_sorted_arrays([],[3,6])
merge_sorted_arrays([1,5],[3,6,9])
