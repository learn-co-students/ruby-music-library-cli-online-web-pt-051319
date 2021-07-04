class Song 
  attr_accessor :name
  attr_reader :artist, :genre 
  @@all = []
  
  def initialize(name, artist=nil, genre = nil)
   @name = name
   self.artist = artist if artist
   self.genre = genre if genre
   
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) 
  end 
  
  def self.all
    @@all
  end 
  
  def genre=(genre) 
    @genre = genre
    genre.songs << self unless genre.songs.include? self 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name) 
    object  = Song.new(name) 
    object.save
    object
  end 
  
  def self.find_by_name(name)
    all.detect {|song| song if song.name == name}
    
  end   

  def self.find_or_create_by_name(name)
    #had it as 
    self.find_by_name(name) || self.create(name) 
    
  end   
   
   
   def self.new_from_filename(file) #reused from Collaborating Objects Lab 
     file = file.gsub(".mp3", "")
     title = file.split(" - ")[1]
     new_song = self.new(title)
     new_song.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
     new_song.genre = Genre.find_or_create_by_name((file.split(" - ")[2]))
     #new_song.artist.add_song(new_song)
     new_song.save
     new_song
  end  
  
  def self.create_from_filename(file)
    self.new_from_filename(file)
  end   
    
    # def self.find_or_create_by_name(name) #reused from Collaborating Objects Lab 
  #   name_match = all.detect{|object| object.name == name}
  #   if name_match
  #     name_match
  #   else
  #     new_object = self.new(name)
  #     new_object.save
  #     new_object
  #   end
  # end  
  
end   