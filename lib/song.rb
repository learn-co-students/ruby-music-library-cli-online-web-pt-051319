require 'pry'
require_relative '../lib/concerns/findable'
class Song
  
 #extend Concerns::Findable
  attr_accessor :name, :artist, :genre 
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
   
    
    self.artist = artist if artist !=nil
    self.genre = genre if genre !=nil
  end
  
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end
  
 
  #make sure to save array in def save before clearing it.
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end
    
  
  def self.find_by_name(name)
      self.all.find {|song|song.name == name}
  end
    
    
  def self.find_or_create_by_name(name)
  # binding.pry
   find_by_name(name) || create(name)
   end

  def self.new_from_filename(filename)
  info = filename.split(" - ")
  artist, name, genre = info[0], info[1], info[2].gsub( ".mp3" , "")
  genre = Genre.find_or_create_by_name(genre)
  artist = Artist.find_or_create_by_name(artist)
  new(name,artist,genre)
end

def self.create_from_filename(filename)
  new_from_filename(filename).save
end
 

end