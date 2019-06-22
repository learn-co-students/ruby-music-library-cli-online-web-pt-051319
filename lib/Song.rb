require 'pry'

class Song
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
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
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self) unless artist.songs.include?(self)
  end
  
  def genre=(genre)
    @genre = genre
    @genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    new_song = Song.find_or_create_by_name(split_filename[1])
    new_song.artist = Artist.find_or_create_by_name(split_filename[0])
    new_song.genre = Genre.find_or_create_by_name(split_filename[2].split(".mp3")[0])
    new_song
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
  
end