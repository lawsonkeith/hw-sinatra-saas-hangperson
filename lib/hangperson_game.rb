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
    @already = ''
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
    if char.length != 1
      raise ArgumentError, 'Argument is not string'
      return false
    end 
    if char.match(/[a-zA-Z]/) == nil
      raise ArgumentError, 'Argument is not string' 
      return false
    end
    
    pick = char.chr.downcase

    #catch replicant entries
    if @guesses.match("#{pick}") != nil
 #     @word_with_guesses << "You have already used that letter"
      return false
    end 
  
    if @wrong_guesses.match("#{pick}") != nil
#    @word_with_guesses << "You have already used that letter"
      return false
    end 
      
    #actual match
    if @word.match("#{pick}") != nil
      guesses << pick # 1st char
    else
      wrong_guesses << pick # 
      @attempt += 1
    end
    
    # build up guess string i.e. "----a-e"
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
    
    #check game status
    if @attempt > 6
      @check_win_or_lose = :lose
    end
    
    return true
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
 
#puts bob.guess("a")
#puts bob.guess(nil)
#puts bob.guess("o")
#puts bob.guess("a")
#puts bob.guess("l")
#puts bob.word_with_guesses
#puts bob.guesses
#puts bob.wrong_guesses
#bob.SpillBeansa
