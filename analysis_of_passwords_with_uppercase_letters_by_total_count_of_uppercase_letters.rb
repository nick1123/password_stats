# How many uppercase letters do passwords have?
# Uppercase Letters: 0    Occurances: 13008653/14344175    (90.7%)
# Uppercase Letters: 1    Occurances: 464404/14344175    (3.2%)
# Uppercase Letters: 6    Occurances: 145766/14344175    (1.0%)
# Uppercase Letters: 2    Occurances: 144692/14344175    (1.0%)
# Uppercase Letters: 5    Occurances: 104634/14344175    (0.7%)
# Uppercase Letters: 7    Occurances: 101182/14344175    (0.7%)
# Uppercase Letters: 4    Occurances: 89465/14344175    (0.6%)
# Uppercase Letters: 8    Occurances: 81487/14344175    (0.6%)
# Uppercase Letters: 3    Occurances: 80040/14344175    (0.6%)

lines = IO.readlines("rockyou-withcount.txt")

uppercase_letter_counts = Hash.new(0)
total_passwords = 0 

lines.each do |line|
  begin
    password = line.to_s.strip.split(/\s+/)[1].to_s
    uppercase_letters = password.scan(/[A-Z]/).size
    uppercase_letter_counts[uppercase_letters] += 1
    total_passwords += 1
  rescue ArgumentError
    # Do nothing
  end 
end

uppercase_letter_counts.sort {|a,b| b[1] <=> a[1]}.each do |uppercase_letters, count|
  percent = (100.0 * count / total_passwords).round(1)

  next if percent < 0.5 

  puts [
    "Uppercase Letters: #{uppercase_letters}",
    "Occurances: #{count}/#{total_passwords}",
    "(" + percent.to_s + "%)"
  ].join("    ")
end
