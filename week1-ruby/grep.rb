filename = ARGV[0]
phrase = ARGV[1]

File.open(filename, 'r') do |f|
    f.each {|line|puts "#{f.lineno}: #{line}" if line.match(/#{phrase}/)}
    # puts "#{#{line}" if line.match(/#{phrase}/)
end