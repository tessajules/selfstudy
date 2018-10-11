# merge meetings
# https://www.interviewcake.com/question/ruby/merging-ranges?course=fc1&section=array-and-string-manipulation

# O(n) time, O(n) space
def merged_meetings(meeting_time_ranges)
  # assuming meetings can fall at most 12 30-minute blocks past 9am
  start_times = Array.new(13, nil) # array of start times at their index
  end_times = Array.new(13, nil) # array of end times - their index is their start time
  meeting_time_ranges.each do |meeting_time_range|
    start_time = meeting_time_range[0]
    end_time = meeting_time_range[1]

    # add start_time to start_times
    start_times[start_time] = start_time

    # add end_time to end_times at its start_time index, unless there is already a later end_time at that index
    end_times[start_time] = end_time unless !end_time[start_time].nil? && end_time[start_time] > end_time
  end

  merged_meeting_times = []

  # start_times look something like [0, nil, nil, 3, 4, nil, nil, nil, nil, 9, 10, nil]
  # end_times look something like  [1, nil, nil, 5, 8, nil, nil, nil, nil, 10, 12, nil]
  last_start_time = nil
  last_end_time = nil
  start_times.each do |start_time|
    next if start_time.nil?

    if last_start_time.nil? # no values have been stored yet
      last_start_time = start_time
      last_end_time = end_times[start_time]
      next
    end

    if start_time <= last_end_time # current start_time is before the last end_time
      if start_time < last_start_time
        # current start_time earlier than last_start_time - assign as last_start_time
        last_start_time = start_time
      end

      if end_times[start_time] > last_end_time
        # current end_time later than last_end_time - assign it end_time as last_end_time
        last_end_time = end_times[start_time]
      end
      next
    end

    if start_time > last_end_time
      # we have reached the start of a new range - store the last range
      merged_meeting_times << [last_start_time, last_end_time]

      # reset the last_end_time and last_start_time to the current values
      last_start_time = start_time
      last_end_time = end_times[start_time]
      next
    end
  end

  # be sure to append the remaining last meeting time range
  merged_meeting_times << [last_start_time, last_end_time]

  merged_meeting_times
end

# meeting_time_ranges = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
# p merged_meetings(meeting_time_ranges) #  should be [[0, 1], [3, 8], [9, 12]]
#
# meeting_time_ranges = [[0, 5], [9, 10], [3, 5], [4, 8], [4, 8]]
# p merged_meetings(meeting_time_ranges) #  should be [[0,8],[9,10]]
#
# meeting_time_ranges = [[7,8],[5,8],[2,9],[1,11],[0,12]]
# p merged_meetings(meeting_time_ranges) #  should be [[0,12]]
#
# meeting_time_ranges = [[5,7],[2,3],[4,5],[10,12]]
# p merged_meetings(meeting_time_ranges) #  should be [[2,3],[4,7],[10,12]]
#
# meeting_time_ranges = [[1, 2], [2, 3]]
# p merged_meetings(meeting_time_ranges) #  should be [[1,3]]
#
# meeting_time_ranges = [[1, 5], [2, 3]]
# p merged_meetings(meeting_time_ranges) #  should be [[1,5]]
#
# meeting_time_ranges = [[1, 10], [2, 6], [3, 5], [7, 9]]
# p merged_meetings(meeting_time_ranges) #  should be [[1,10]]
#
# meeting_time_ranges =   [[1, 3], [2, 4]]
# p merged_meetings(meeting_time_ranges) #  should be [[1,4]]


# O(nlogn) time, O(n) space
def merged_meetings_2(meeting_time_ranges)
  # merged_meetings where we cannot assume how many time blocks
  meeting_time_ranges = meeting_time_ranges.sort

  merged_meeting_times = []

  last_start_time = nil
  last_end_time = nil
  meeting_time_ranges.each do |meeting_time_range|
    start_time = meeting_time_range[0]
    end_time = meeting_time_range[1]

    if last_start_time.nil? # no values have been stored yet
      last_start_time = start_time
      last_end_time = end_time
      next
    end

    if start_time <= last_end_time # current start_time is before the last end_time
      if start_time < last_start_time
        # current start_time earlier than last_start_time - assign as last_start_time
        last_start_time = start_time
      end

      if end_time > last_end_time
        # current end_time later than last_end_time - assign it end_time as last_end_time
        last_end_time = end_time
      end
      next
    end

    if start_time > last_end_time
      # we have reached the start of a new range - store the last range
      merged_meeting_times << [last_start_time, last_end_time]

      # reset the last_end_time and last_start_time to the current values
      last_start_time = start_time
      last_end_time = end_time
      next
    end
  end

  # be sure to append the remaining last meeting time range
  merged_meeting_times << [last_start_time, last_end_time]

  merged_meeting_times
end

meeting_time_ranges = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
p merged_meetings_2(meeting_time_ranges) #  should be [[0, 1], [3, 8], [9, 12]]

meeting_time_ranges = [[0, 5], [9, 10], [3, 5], [4, 8], [4, 8]]
p merged_meetings_2(meeting_time_ranges) #  should be [[0,8],[9,10]]

meeting_time_ranges = [[7,8],[5,8],[2,9],[1,11],[0,12]]
p merged_meetings_2(meeting_time_ranges) #  should be [[0,12]]

meeting_time_ranges = [[5,7],[2,3],[4,5],[10,12]]
p merged_meetings_2(meeting_time_ranges) #  should be [[2,3],[4,7],[10,12]]

meeting_time_ranges = [[1, 2], [2, 3]]
p merged_meetings_2(meeting_time_ranges) #  should be [[1,3]]

meeting_time_ranges = [[1, 5], [2, 3]]
p merged_meetings_2(meeting_time_ranges) #  should be [[1,5]]

meeting_time_ranges = [[1, 10], [2, 6], [3, 5], [7, 9]]
p merged_meetings_2(meeting_time_ranges) #  should be [[1,10]]

meeting_time_ranges =   [[1, 3], [2, 4]]
p merged_meetings_2(meeting_time_ranges) #  should be [[1,4]]
