require 'bundler'
Bundler.require

module Concerns
end

require_relative '../lib/concerns/findable.rb'
require_relative '../lib/MusicImporter.rb'
require_relative '../lib/musiclibrarycontroller.rb'
require_all 'lib'


