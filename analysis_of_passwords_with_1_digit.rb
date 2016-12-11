# Where do people place a single digit in there password
# Note: position -1 means the last position
# Position: -1   Occurances: 1051490/1489834   (70.6%)
# Position: 6   Occurances: 273469/1489834   (18.4%)
# Position: 7   Occurances: 258490/1489834   (17.4%)
# Position: 8   Occurances: 207510/1489834   (13.9%)
# Position: 5   Occurances: 189348/1489834   (12.7%)
# Position: 9   Occurances: 163393/1489834   (11.0%)
# Position: 0   Occurances: 124917/1489834   (8.4%)

lines = IO.readlines("rockyou-withcount.txt")

positions = Hash.new(0)
total_passwords = 1 

lines.each do |line|
  begin
    word = line.to_s.strip.split(/\s+/)[1].to_s

    # We only want passwords with 1 digit
    next unless word.gsub(/\d/, '').size == word.size - 1 

    positive = word.index(/\d/)
    negative = positive - word.size
    positions["Position: " + positive.to_s] += 1
    positions["Position: " + negative.to_s] += 1

    total_passwords += 1
  rescue ArgumentError
    # Do nothing
  end 
end

positions.sort {|a,b| b[1] <=> a[1]}.each do |position, count|
  puts [
    position,
    "Occurances: #{count}/#{total_passwords}",
    "(" + (100.0 * count / total_passwords).round(1).to_s + "%)"
  ].join("   ")
end

