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
          "username" => "your_account_in_pinboard",
          "password" => "your_password_in_pinboard"
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
        pinboard.posts(:tag => ARGV[0]).each do |post|
          puts post[1] + " || " + post[0].green
        end
      end
    end

  end
end
