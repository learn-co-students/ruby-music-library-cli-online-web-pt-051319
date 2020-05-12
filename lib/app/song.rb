require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    
    if artist != nil
      self.artist=(artist)
    if genre != nil
      self.genre=(genre)  
    end  
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
    x = Song.new(name)
    x.save
    return x
  end

  def artist=(name)
    @artist = name
    @artist.add_song(self)
  end

  def genre=(name)
    @genre = name
    @genre.songs.include?(self) ? self : @genre.songs << self
  end
  
  def self.find_by_name(name)
    @@all.find { |thing| thing.name == name }
  end
  
  def self.find_or_create_by_name(name)
    # binding.pry
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  
  def self.new_from_filename(file)
    # binding.pry
    x = file.split(" - ")
    song = Song.find_or_create_by_name(x[1])
    song.artist = Artist.find_or_create_by_name(x[0])
    genre = x[2].split(".")[0]
    song.genre = Genre.find_or_create_by_name(genre)
     return song
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end  


end  