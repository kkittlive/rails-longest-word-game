require 'open-uri'

class GamesController < ApplicationController
  def new
    @alphabet = 'abcdefghijklmnopqrstuvwxyz'.each_char.to_a
    @letters = @alphabet.sample(10)
  end

  def score
    @letters = JSON.parse(params[:letters]).sort!
    @answer = params[:answer].each_char.to_a.sort!

    # The word can’t be built out of the original grid
    @answer.each do |letter|
      index = @letters.index(letter)
      if index
        @letters.delete_at(index)
      else
        return @outcome = "Your word can't be constructed with the provided letters"
      end
    end

    # The word is valid according to the grid, but is not a valid English word
    url = 'https://wagon-dictionary.herokuapp.com/'
    unless JSON.parse(open("#{url}#{params[:answer]}").read)['found']
      return @outcome = "Your word isn't a valid Enlgish word"
    end

    # The word is valid according to the grid and is an English word
    @outcome = 'Nice job!'
  end

  def create

  end
end
