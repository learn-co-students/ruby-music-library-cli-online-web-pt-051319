require 'pry'
require_relative '../lib/concerns/findable'

class Genre 
  extend Concerns::Findable
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def songs
    @songs
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
  
  def self.create(name)
    self.new(name)
  end
  
  def add_song(song)
    if song.genre == nil
        song.genre = self
    end
  
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  # def new_song(name, artist = nil, genre = nil)
  #   Song.new(name, artist, self)
  # end
  
   def artists
    artists = @songs.collect do |song|
     song.artist
     end
     artists.uniq
    end
  end
