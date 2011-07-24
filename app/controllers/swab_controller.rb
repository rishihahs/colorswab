class SwabController < ApplicationController
  def index
    if !session[:color].blank? or !session[:colors].blank?
      @color = session[:color]
      @colors = session[:colors]
      session[:color] = nil
      session[:colors] = nil
    else
      swabs("#fff")
      @color = @color.html
    end
  end
  
  def colors
    swabs(params[:color] || "#fff")
    respond_to do |format|
      format.html { 
        session[:color] = @color.html
        session[:colors] = @colors
        redirect_to(swab_url)
      }
      format.js
    end
  end
  
  private
  
    def swabs(color)
      begin
        @color = Color::RGB.from_html(color)
      rescue ArgumentError
        @color = Color::RGB.from_html("#fff")
      end
      @colors = []

      4.times do |n|
        @colors << @color.lighten_by((n*10)).html
      end

      @colors = @colors.drop(1)

      4.times do |n|
        @colors << @color.darken_by(100-(n*10)).html
      end
    end
end
