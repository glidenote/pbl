# -*- coding: utf-8 -*-

require 'pit'
require 'pinboard'
require 'colored'

module Pbl
  class CLI
    def initialize
      config = Pit.get(:pinboard,
        require: {
          username: "your_account_in_pinboard",
          password: "your_password_in_pinboard"
        }
      )

      @pinboard = Pinboard::Client.new(
        username: config[:username],
        password: config[:password]
      )

      @argv = ARGV || []
    end

    def self.run
      self.new.run
    end

    def run
      abort "Usage: pbl TAG" if @argv.empty?
      @pinboard.posts(:tag => @argv.join(',')).each do |post|
        puts "%s || %s" % [post[1], post[0].green]
      end
    end
  end
end
