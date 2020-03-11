class BoardsController < ApplicationController

  def index
    present 'boards/index'
  end

  def create
    present 'boards/create'
  end

  def show
    present 'boards/show'
  end

end
