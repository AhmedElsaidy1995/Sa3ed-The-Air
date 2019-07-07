require 'gosu'
require_relative 'motorcycle'
require_relative 'knife'

def media_path(file)
  File.join(File.dirname(File.dirname(__FILE__)), 'images', file)
end

class Window  < Gosu::Window
  BACKGROUND = media_path('ambaleh.jpg')

  def initialize
    super 900, 400
    @player = Motorcycle.new(self)
    @bullet = Knife.new(self)
    self.caption = "betengan Game"
    @background_image = Gosu::Image.new(BACKGROUND, :tileable => true)
    @music = Gosu::Song.new(self, media_path('ambaleh.wav'))
    @music.volume = 0.5
    @music.play(true)
  end

  def update
    if button_down? Gosu::Button::KbLeft
      @player.move_left
    end

    if button_down? Gosu::Button::KbRight
      @player.move_right
    end

    if button_down? Gosu::Button::KbDown
      @player.move_down
    end

    if button_down? Gosu::Button::KbUp
      @player.move_up
    end
    @bullet.update

  end

  def draw
    @background_image.draw(0, 0, 0)
    @player.draw
    @bullet.draw
  end
end


Window.new.show