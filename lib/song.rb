require 'pry'

class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  ##initialize: can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' property (song belongs to artist)
  
  def initialize(name, artist = nil, genre = nil) 
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
  def Song.create(name)
    # binding.pry
   new_song = self.new(name) 
   new_song.save
   new_song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    # binding.pry
    self.all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    name_split = filename.split(" - ")
    artist_name = name_split[0]
    song_name = name_split[1]
    genre_name = name_split[2].split(".mp3")[0]
    new_song = Song.find_or_create_by_name(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_song
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
  
  
end