class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_reader :guesses
  attr_reader :wrong_guesses 
  attr_reader :word
  attr_reader :word_with_guesses
  attr_reader :check_win_or_lose
  
  def initialize(word)
    @word = word #mystery word
    @wrong_guesses = ''
    @guesses = ''
    @attempt = 0
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
    @attempt += 1
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
      rval =  true
    else
      wrong_guesses << pick # 
      rval = false
    end
    
    # build up guess
    @word_with_guesses = '';
    @check_win_or_lose = :win
    word.each_char  { |a|
      if  @guesses.match("#{a}") != nil  
        @word_with_guesses << a
      else
        @word_with_guesses << '-'
        @check_win_or_lose = :play
      end
    }
    if @attempt >= 7 
      @check_win_or_lose = :lose
    end
    
    return rval
  end
  

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
#puts bob.guess("o")
#puts bob.guess("a")
#puts bob.guess("l")
#puts bob.word_with_guesses
#puts bob.guesses
#puts bob.wrong_guesses
#bob.SpillBeansa
