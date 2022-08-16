require 'json'
require 'open-uri'

class GamesController < ApplicationController
  before_action :new
  
  def new
    @letters = [*('a'..'z')].sample(10)
  end

  def each_letter?
    params[:word].chars.all? { |letter| @letters.include?(letter) }
  end

  def dictionary?
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    data = JSON.parse(URI.open(url).read)
    data.Found
  end

  def score
    if each_letter? && dictionary?
      "Congratulation";
    else
      "not yet";
    end

  end

end
