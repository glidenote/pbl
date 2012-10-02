# -*- coding: utf-8 -*-

require 'pbl'
require 'pit'
require 'pinboard'
require 'colored'

module Pbl
  class CLI
    def initialize(*args)
      config = Pit.get("pinboard",
        require: {
          "username" => "your account in pinboard",
          "password" => "your password in pinboard"
      }
    )

    @username = config['username']
    @passowrd = config['password']
    end

    def self.run(*args)
      self.new(*args).run
    end

    def run
      unless ARGV.empty?
        pinboard = Pinboard::Client.new(:username => "#{@username}", :password => "#{@passowrd}")
        posts = pinboard.posts
        data = pinboard.posts(:tag => ARGV[0]) #all posts tagged 'ruby'
        for i in 1..data.size
          num = i - 1
          print "#{data[num][1]} || "
          print "#{data[num][0]}".green,"\n"
        end
      end
    end

  end
end
