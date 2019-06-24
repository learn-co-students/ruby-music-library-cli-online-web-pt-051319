require 'pry'
require_relative '../lib/concerns/findable'

class Song 
 
  attr_accessor :name, :artist, :genre
 
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist !=nil
    self.genre = genre if genre !=nil
   
  end

  
  
  # def artist 
  #   @artist
  # end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre
    @genre
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  # created_song = Song.create("Kaohsiung Christmas")
  
  def self.create(name)
   song = Song.new(name)
   song.save
   song
  end
  
  def self.find_by_name(name)
   
    self.all.find {|song| song.name == name}
    
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    artist, song = filename.split(" - ")
    genre = filename.split(" - ").pop.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
  
end
