# For passwords with only 1 uppercase letter, what position does it occur in?
# Note: negative values indicate distance from the end of the password.  So -1 is the last char
# Position: 0   Occurances: 395472/464404   (85.2%)
# Position: -8   Occurances: 103221/464404   (22.2%)
# Position: -7   Occurances: 79510/464404   (17.1%)
# Position: -9   Occurances: 70581/464404   (15.2%)
# Position: -6   Occurances: 52486/464404   (11.3%)
# Position: -10   Occurances: 49085/464404   (10.6%)
# Position: -11   Occurances: 22179/464404   (4.8%)
# Position: -1   Occurances: 20852/464404   (4.5%)

lines = IO.readlines("rockyou-withcount.txt")

positions = Hash.new(0)
total_passwords = 0 

lines.each do |line|
  begin
    password = line.to_s.strip.split(/\s+/)[1].to_s
    uppercase_letters = password.scan(/[A-Z]/).size
    next unless uppercase_letters == 1

    positive = password.index(/[A-Z]/)
    negative = positive - password.size
    positions[positive] += 1
    positions[negative] += 1

    total_passwords += 1
  rescue ArgumentError
    # Do nothing
  end
end

positions.sort {|a,b| b[1] <=> a[1]}.each do |position, count|
  percent = (100.0 * count / total_passwords).round(1)

  next if percent < 0.1 

  puts [
    "Position: #{position}",
    "Occurances: #{count}/#{total_passwords}",
    "(" + percent.to_s + "%)"
  ].join("   ")
end

