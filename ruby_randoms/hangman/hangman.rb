=begin Hangman

  A simple word game
  Date: 5th Aug, 2011
  Author: Anis uddin Ahmad <anisniit@gmail.com>
=end


#require SecureRandom

words = %w"learning lollipop education image computer mobile january february friday flower beauty light earth machine book
news yahoo google internet bangladesh india america cricket football friday sunday sunny"
total_chances = 5
wrong_try = 0
right_guess = ''
incorrect_guesses = ''

hanged = <<HANG
 +---+-
 |   |
 |   0
 |   |\\
 |   /\\
-+----------
HANG
survibed = <<WIN
   (@)
  ^\\|
    |/^
____|_____
WIN

#puts words.inspect

word = words[rand(words.length) - 1]
#word = words[1]

def get_placeholder sample_word, guessed_words
  placeholder = ''
  sample_word.chars { |char|
    placeholder += (guessed_words.include? char)? char : '#'
  }

  placeholder
end

def prev_incorrect_guesses(incorrect_guesses)
  ''.ljust(20) + 'Incorrect tries: ' + incorrect_guesses.upcase.chars.sort.join(', ')
end

puts `clear`
puts 'Guess what is:'+ get_placeholder(word, '')

while true
  print "Enter word [#{total_chances - wrong_try} chances left]:"

  char = gets.chomp
  puts `clear`

  if word.include? char

    if(right_guess.include? char)
      puts char + ' is already given and accepted.'
      puts 'Try another: ' + get_placeholder(word, right_guess) + prev_incorrect_guesses(incorrect_guesses)
    else
      right_guess = right_guess + char
      placeholder = get_placeholder(word, right_guess) + prev_incorrect_guesses(incorrect_guesses)

      puts 'Great! ' + placeholder
    end

    unless placeholder.include? '#'
      puts "WELL DONE!! YOU SURVIVED"
      puts survibed
      break
    end
  else
    if(incorrect_guesses.include? char)
      puts char + ' has already been guessed and is incorrect!'
      puts 'Try another: ' + get_placeholder(word, right_guess) + prev_incorrect_guesses(incorrect_guesses)
    else
	    puts "Sorry! The word dosen't contains '#{char}'"
	    wrong_try += 1
      incorrect_guesses += char

	    if (wrong_try == total_chances)
	      puts "YOU HANGED!"
	      puts hanged
	      break
	    else
	      puts 'Try another: ' + get_placeholder(word, right_guess) + prev_incorrect_guesses(incorrect_guesses)
	    end

    end
  end

end
