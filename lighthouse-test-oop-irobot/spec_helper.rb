require 'pry'
require 'rspec'
require './safe_require'

def safe_require(file)
  require file
rescue LoadError
  # ignore
end

safe_require 'robot'
safe_require 'item'
safe_require 'weapon'
safe_require 'box_of_bolts'
safe_require 'laser'
safe_require 'plasma_cannon'
