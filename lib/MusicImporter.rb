require 'pry'

class MusicImporter 
  
  def initialize(path)
    @path = path
  end 
  
  def path 
    @path
  end
  
  def files 
  #binding.pry
    files = Dir.glob("#{@path}/*.mp3")
      files.collect do |f|f.gsub("#{@path}/", "")
    end
  end 

  def import 
    self.files.each {|filename| Song.create_from_filename(filename)}
  end 
    
end 