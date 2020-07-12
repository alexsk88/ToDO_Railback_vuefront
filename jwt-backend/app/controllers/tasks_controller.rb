class TasksController < ApplicationController
    before_action :authorized
    before_action :set_task,  except: [ :index, :create]
    
    # Handle Errors
    rescue_from Exception do |e|
        render json: {error: e.message, status: 'error'}, status: :internal_error
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message, status: 'error'}, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message, status: 'error'}, status: :unprocessable_entity
    end
    # Handle Errors

    def index
        @tasks = Task.all
        render json: {tasks: @tasks, status: :success}
    end

    def show
        render json: {tasks: @task, status: :success, message:"Task Found"}
    end
    
    def create
        @task = @user.tasks.new(task_params)

        if @task.save
            render json: {tasks: @task, status: :success, message:"Task Created"}
        else
            render json: {message:@task.errors, status: 'error'}
        end
        
    end
    
    def update
        if @task.update(task_params)
            render json: {tasks: @task, status: :success, message:"Task Updated"}
        else 
            render json: {message:@task.errors, status: 'error'}
        end
    end 
    
    def remove
        if @task.destroy
            render json: {tasks: @task, status: :success,message:"Task Removed"}
        else
            render json: {message:@task.errors, status: 'error'}
        end
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :content, :date_start, :date_end)
    end
end
