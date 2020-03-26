class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  
  
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self
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
  
  def self.create(artist)
    artist = self.new(artist)
    #binding.pry
  end 
  
  def add_song(song)
    song.artist = self unless song.artist 
    @songs << song unless @songs.include?(song)
  end 

def genres
  songs.collect(&:genre).uniq 
end 

  
end 