class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self 
  end 
  
  def songs
    @songs 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    all.clear 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(genre)
    genre = self.new(genre)
  end 
  
  def artists
    songs.collect(&:artist).uniq
  end 
  
  #binding.pry 
  
end 