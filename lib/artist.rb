require_relative '../lib/concerns/findable.rb'

require 'pry'
class Artist 
 extend Concerns::Findable
  
  attr_accessor :name, :songs
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
  
  def Artist.create(name)
    # binding.pry
   new_artist = self.new(name) 
   new_artist.save
   new_artist
  end
  
      # Does not assign the artist if the song already has an artist
  def add_song(song)  
      song.artist = self unless song.artist
      @songs << song unless songs.include?(song)
    # end
  end
  
  def genres
    songs.collect {|song| song.genre}.uniq
  end
  
  
end