class SwabController < ApplicationController
  def index
    orig = Color::RGB.from_html("#fff")
    @colors = []
    
    4.times do |n|
      @colors << orig.darken_by(100-(n*10))
    end
  end
  
  def colors
    
  end
end
