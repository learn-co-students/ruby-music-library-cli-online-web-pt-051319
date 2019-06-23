
class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs, :genres
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
 # initializes, saves, and returns the song
  def Genre.create(name)
    # binding.pry
   new_genre = self.new(name) 
   new_genre.save
   new_genre
  end
  
  def artists       # returning a collection of artists for all of the genre's songs
    songs.map {|song| song.artist}.uniq
  end
  
end