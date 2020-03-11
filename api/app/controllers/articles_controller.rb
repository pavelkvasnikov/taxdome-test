class ArticlesController < ApplicationController

  def index
    present 'articles/index'
  end

  def create
    present 'articles/create'
  end

  def destroy
    present 'articles/destroy'
  end

end
