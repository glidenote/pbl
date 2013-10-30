# -*- coding: utf-8 -*-

require 'pit'
require 'pinboard'
require 'colored'
require 'moji'
require 'pager'

class String
  def cut(truncated_at = 70, replace = "...")
    ret = ""
    length = 0
    self.each_char do |char|
      Moji.type?(char, Moji::ZEN) ? length += 2 : length += 1
      break if length > truncated_at
      ret << char
    end
    if length > truncated_at
      ret << replace
    else
      ret = " " * (truncated_at - length + 1 + replace.size) + ret
    end
    ret + " |"
  end
end

module Pbl
  class CLI
    include Pager

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
      page unless $test_env
      if @argv.empty?
        bookmarks = @pinboard.posts(:results => 150)
      else
        bookmarks = @pinboard.posts(:tag => @argv.join(','))
      end

      bookmarks.each do |post|
          puts "[%s] %s %s" % [post[:time].strftime("%Y/%m/%d").cyan, post[:description].cut, post[0].green]
      end
    end
  end
end
