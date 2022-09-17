# write a program that picks a random number. 
# Let a player guess the number, 
# telling the player whether the guess is 
# too low or too high.

num = rand(1..10)
guess = nil

while guess != num
    print "enter a guess from 1 to 10: "
    STDOUT.flush
    # puts "enter a guess: "
    guess = gets.chomp.to_i
    if guess > num
        puts "guess is too high\n"
    elsif guess < num
        puts "guess is too low\n"
    end
    break if guess == num
end

puts "correct, number was #{num}"