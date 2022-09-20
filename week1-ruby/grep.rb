filename = ARGV[0]
phrase = ARGV[1]

File.open(filename, 'r').each do |line|
    puts line if line.match(/#{phrase}/)
end