require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :artist
  
  
  @@all = [ ]
  
  def initialize(name)
   @name = name 
   @@all << self
   @songs = [ ]
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
    genre = new(name)
    genre.save
    genre
  end
  
  def artists
    songs.collect(&:artist).uniq
 end
  
  
end