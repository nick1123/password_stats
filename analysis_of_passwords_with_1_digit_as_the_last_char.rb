# When the last char of a password is a digit, how often is it each the digits 0-9
# Digit: 1   Occurances: 471104/1051490   (44.8%)
# Digit: 2   Occurances: 132107/1051490   (12.6%)
# Digit: 3   Occurances: 90860/1051490   (8.6%)
# Digit: 7   Occurances: 75567/1051490   (7.2%)
# Digit: 5   Occurances: 64339/1051490   (6.1%)
# Digit: 4   Occurances: 57263/1051490   (5.4%)
# Digit: 8   Occurances: 48403/1051490   (4.6%)
# Digit: 6   Occurances: 44323/1051490   (4.2%)
# Digit: 9   Occurances: 43054/1051490   (4.1%)
# Digit: 0   Occurances: 24470/1051490   (2.3%)

lines = IO.readlines("rockyou-withcount.txt")

digits_count = Hash.new(0)
total_passwords = 0 

lines.each do |line|
  begin
    password = line.to_s.strip.split(/\s+/)[1].to_s

    # Is there exactly 1 digit in the password?
    next unless password.gsub(/\d/, '').size == password.size - 1 

    # Is the digit at the very end of the password?
    next unless password.index(/\d/) == (password.size - 1)

    digit = password.match(/\d/).to_s
    digits_count[digit] += 1
    total_passwords += 1
  rescue ArgumentError
    # Do nothing
  end 
end

digits_count.sort {|a,b| b[1] <=> a[1]}.each do |digit, count|
  puts [
    "Digit: #{digit}",
    "Occurances: #{count}/#{total_passwords}",
    "(" + (100.0 * count / total_passwords).round(1).to_s + "%)"
  ].join("   ")
end

