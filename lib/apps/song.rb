
require "pry"

class Song 
  
  attr_accessor :name 
  attr_reader :artist, :genre

  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
   # @songs = []
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self 
  end
  
  def self.find_by_name(name)
    all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)  
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
  
  def self.create(song)
    self.new(song).tap {|song| song.save}
  end
  
  def self.new_from_filename(name)
    artist_name, song_name, genre_name = name.split(" - ")
    fixed_name = genre_name.split(".mp3")[0] 
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(fixed_name) 
    Song.new(song_name, artist, genre)
    #binding.pry 
  end
  
  def self.create_from_filename(name)
    new_from_filename(name).save
    #binding.pry 
  end
  
end