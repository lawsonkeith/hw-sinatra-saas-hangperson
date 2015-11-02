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
  
  # 
  def SpillBeans
    puts @word
  end

end


#RandWrd = HangpersonGame.get_random_word
#bob = HangpersonGame.new(RandWrd)
#puts bob.guesses
#bob.SpillBeansa
