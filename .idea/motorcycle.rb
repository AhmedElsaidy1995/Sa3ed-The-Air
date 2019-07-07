require 'gosu'
require_relative 'window'
require_relative 'knife'

def media_path(file)
  File.join(File.dirname(File.dirname(__FILE__)), 'images', file)
end

MOTORCYCLE = media_path('motorcycle.png')
class Motorcycle
  def initialize(window)
    @window = window
    @icon = Gosu::Image.new(@window, MOTORCYCLE, true)
    @x = 0
    @y = 0
  end

  def move_left
    @x = @x - 10
    if @x < 0
      @x = 0
    end
  end

  def move_up
    @y = @y - 10
    if @y < 0
      @y = 0
    end
  end

  def move_right
    @x = @x + 10
    if @x > @window.width-50
      @x = @window.width-50
    end
  end

  def move_down
    @y = @y + 10
    if @y > @window.height-50
      @y = @window.height-50
    end
  end

  def draw
    @icon.draw(@x,@y,1)
  end
end
