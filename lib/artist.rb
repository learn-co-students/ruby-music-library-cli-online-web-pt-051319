require_relative 'concerns/findable'
class Artist 
 extend Concerns::Findable
  

  attr_accessor :name, :songs 
  @@all = []
  
  def initialize(name)
   @name = name
   @songs = []
  end 
  
  def self.all
    @@all
  end 
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name) 
    object  = Artist.new(name) 
    object.save
    object
  end 
  
      
  def add_song(song)  
    self.songs << song unless self.songs.include? song 
    #binding.pry
    song.artist == nil ? song.artist = self : song.artist
  end 
  
  def genres 
    genres = []
    self.songs.each {|song | genres << song.genre } 
    genres.uniq
  end 
  

  
end   