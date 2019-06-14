class Genre
  attr_accessor :name
  @@all = []
  
  def initialize(name)
   @name = name
   @songs = []
  end 
  
  def self.all
    @@all
  end 
  
  def songs
    @songs 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name) 
    object = Genre.new(name) 
    object.save
    object
  end 
  
  def artists
    #another way to do it in one line same on Artist class
    self.songs.collect {|song| song.artist }.uniq
  end   
  
end   