class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_reader :guesses
  attr_reader :wrong_guesses 
  attr_reader :word
  
  def initialize(word)
    @word = word #mystery word
    @wrong_guesses = ''
    @guesses = ''
  end

  # CLASS method -ref with class name
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  # guess if char is in word y/n   char.chr
  def guess char
    #get 1st char
    
    if char.nil?
      raise ArgumentError, 'Argument is not string' 
      return false
    end
    raise ArgumentError, 'Argument is not string' unless char.length == 1
    raise ArgumentError, 'Argument is not string' unless char.match(/[a-zA-Z]/) 

    pick = char.chr.downcase

    #catch replicant entries
    if @guesses.match("#{pick}") != nil
      return false
    end 
  
    if @wrong_guesses.match("#{pick}") != nil
      return false
    end 
      
    #actual match
    if @word.match("#{pick}") != nil
      guesses << pick # 1st char
      return true
    else
      wrong_guesses << pick # 
      return false
    end
  end 

  #def guess_several_letters charstr
    #itereate every char
   # charstr.each_char { |i|
    #  guess(i)
    #}
  #end 
  
  # 
  def SpillBeans
    puts @word
  end

end


#RandWrd = HangpersonGame.get_random_word
#bob = HangpersonGame.new(RandWrd)
#bob = HangpersonGame.new("aalo")
#puts bob.guesses
 #guess_several_letters(bob, 'aaloq')
#puts bob.guess("a")
#puts bob.guess(nil)
#puts bob.guess("q")
#puts bob.guess("a")
#puts bob.guess("l")
#puts bob.guesses
#puts bob.wrong_guesses
#bob.SpillBeansa
