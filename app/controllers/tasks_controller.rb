class TasksController < ApplicationController
   before_action :set_task, only: [:show, :edit, :uptade, :destroy, :done, :undone]

  def list
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def uptade
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.delete
    redirect_to tasks_path
  end

  def done
    @task.completed = true
    @task.save
    redirect_to tasks_path
  end

  def undone
    @task.completed = false
    @task.save
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
