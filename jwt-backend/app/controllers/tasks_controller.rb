class TasksController < ApplicationController
    before_action :authorized, except: [:mipdf]
    before_action :set_task,  except: [ :index, :create, :mipdf]
    
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

        if params[:state].present? && !params[:state].nil? 
            @tasks = Task.where(user_id: @user.id, state: params[:state])
        else
            @tasks = Task.where(user_id: @user.id)
        end
      
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

    def mipdf 
        @id_user = params[:id_user]
        @state = params[:state]
        @tasks = Task.where("user_id = ? AND state = ?",@id_user,@state)
  
        pdf_html = ActionController::Base.new.render_to_string(template: 'tasks/reporte.html.erb', 
            :locals => {:tasks => @tasks})
        pdf = WickedPdf.new.pdf_from_string(pdf_html)
        send_data pdf, filename: 'file_name.pdf'
   
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :content, :date_start, :date_end, :state)
    end
end
