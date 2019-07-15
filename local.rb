#!/usr/bin/env ruby
# == Wrapper script to update a local postgrseql database
#
# == Usage
#  ./local.rb
#

Dir.chdir(File.dirname($0)) {
  command = "sem-apply --url postgresql://pupiloo@localhost/pupiloo --password"
  puts command
  exec(command)
}
