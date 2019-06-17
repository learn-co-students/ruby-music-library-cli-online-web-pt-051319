# class MusicImporter
  
#   attr_reader :path
  
#   def initialize(path)
#     @path = path
#   end
  
  # def files 
  #   @files = Dir.entries(@path)
  #   @files.delete_if {|file| file == "." || file == ".."}
  # end
  
  # def files
  #   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  # end




  # def import 
  #   self.files.each do |file|
  #     song = Song.create_from_filename(file)
  #   end
  # end
  
# end

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{ |f| Song.create_from_filename(f) }
  end
end



