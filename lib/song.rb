require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre= nil)
    @name = name
    @genre = genre
    if artist != nil
      self.artist=(artist)
    genre = nil ? @genre = nil : self.genre=(genre)
      
    end  
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
  
  def self.create(name)
    Song.new(name).save
    self
  end

  def artist=(name)
    # binding.pry
    @artist = name
    @artist.add_song(self)
  end

  def genre=(name)
    # binding.pry
    @genre = name
    @genre.songs.include?(self) ? self : @genre.songs << self
  end  


end  