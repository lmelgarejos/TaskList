class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)

    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update_attributes(task_params)
    task.save

    redirect_to tasks_path(task)
  end

  def self.random_time
    Time.at(rand * Time.now.to_i)
  end

  def completed
    @task = Task.find(params[:id])
    # @task.completed = true
    @task.completed_at = Time.at(rand * Time.now.to_i)
    @task.save

    redirect_to task_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    redirect_to tasks_path
  end


  private
  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
