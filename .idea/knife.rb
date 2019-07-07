require 'gosu'
require_relative 'motorcycle'
require_relative 'window'

def media_path(file)
  File.join(File.dirname(File.dirname(__FILE__)), 'images', file)
end

KNIFE = media_path('knife.png')

class Knife
  #attr_reader :x, :y

  def initialize(window)
    @window = window
    @icon = Gosu::Image.new(@window, KNIFE, true)
    @y = rand(@window.height)
    @x = 0
  end

  def update
    @x = @x + 10
    if @x > @window.width
      @x = 0
      @y = rand(@window.height)
    end
  end

  def draw
    @icon.draw(@x, @y, 3)
  end
end
