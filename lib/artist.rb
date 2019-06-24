require 'pry'
require_relative '../lib/concerns/findable'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
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
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == nil
        song.artist = self
    end
  
    if !@songs.include?(song)
        @songs << song
    end
  end
  
  # def new_song(name, artist = nil, genre = nil)
  #   Song.new(name, self, genre)
  # end
  
  def genres
    genres = @songs.collect do |song|
     song.genre
     end
     genres.uniq
    end
  end
