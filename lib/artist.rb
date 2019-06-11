require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    # binding.pry
    song.artist ||= self
    @songs.include?(song) ? song : @songs << song
  end  

  def songs
    @songs
  end
  
  def genres
    all_genres = []
    @songs.each do |song|
      if !all_genres.include?(song.genre)   
        all_genres << song.genre
      end
    end
    all_genres
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
    Artist.new(name).save
    self
  end

end  