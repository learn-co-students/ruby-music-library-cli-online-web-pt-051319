require 'pry'

class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
   Dir.glob("#{path}/*.mp3").collect do |file_name| file_name.split("/").pop
    end
  end
  
  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end
  
end