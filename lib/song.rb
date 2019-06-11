require 'pry'
class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
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

end  