# -*- encoding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'thin'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/*/' do |path|
  raise Sinatra::NotFound unless File.exist?(settings.public_folder + '/' +  path + '/index.html')
  send_file File.join(settings.public_folder, path, 'index.html')
end
