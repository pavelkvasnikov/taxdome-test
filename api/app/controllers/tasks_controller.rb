class TasksController < ApplicationController

  def index
    present 'tasks/index'
  end

  def create
    present 'tasks/create'
  end

  def update
    present 'tasks/update'
  end

  def destroy
    present 'tasks/destroy'
  end

end
