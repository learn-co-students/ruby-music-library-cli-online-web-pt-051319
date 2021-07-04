class MusicImporter
  attr_accessor :path
  
  
 def initialize(path)
   @path = path 
 end 
  
 #reused from Collaborating Objects Lab  
 def files
    Dir.entries(@path).select {|i| i.end_with? ".mp3" }
 end
 
 def import
    self.files.each {|filename| Song.create_from_filename(filename)}
 end 
  
end 