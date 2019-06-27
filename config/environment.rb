require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'

require_relative '../lib/findable'
require_relative '../lib/artist'
require_relative '../lib/genre'
require_relative '../lib/song'