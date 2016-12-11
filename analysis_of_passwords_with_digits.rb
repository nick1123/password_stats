# Output from Rock You password dump
# Digits: 0   Occurances: 4588125/14344175   (32.0%)
# Digits: 2   Occurances: 2288534/14344175   (16.0%)
# Digits: 1   Occurances: 1489833/14344175   (10.4%)
# Digits: 4   Occurances: 1483776/14344175   (10.3%)
# Digits: 3   Occurances: 1008460/14344175   (7.0%)
# Digits: 6   Occurances: 888941/14344175   (6.2%)
# Digits: 7   Occurances: 636610/14344175   (4.4%)
# Digits: 8   Occurances: 550069/14344175   (3.8%)

lines = IO.readlines("rockyou-withcount.txt")

digit_counts = Hash.new(0)

total_passwords = 0 

lines.each do |line|
  begin
    word = line.to_s.strip.split(/\s+/)[1].to_s
    digits = word.size - word.gsub(/\d/, '').size
    digit_counts[digits] += 1
    total_passwords += 1
  rescue ArgumentError
    # Do nothing
  end 
end

digit_counts.sort {|a,b| b[1] <=> a[1]}.each do |digits, count|
  puts [
    "Digits: #{digits}",
    "Occurances: #{count}/#{total_passwords}",
    "(" + (100.0 * count / total_passwords).round(1).to_s + "%)"
  ].join("   ")
end

