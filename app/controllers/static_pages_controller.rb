class StaticPagesController < ApplicationController
  def home
    @list = List.new
    @lists = List.all
  end

  def contact
  end

  def help
  end

  def about
  end
end
