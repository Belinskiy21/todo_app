class TasksController < ApplicationController
  before_action :set_task, only: [ :edit, :update, :destroy]
 

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

      unless @task.save
        flash[:error] = "Error! Something went wrong..."
      end
        redirect_to  user_path(params[:user_id])
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task=Task.find_by(id: params[:id])
    unless @task
    redirect_to user_path(params[:user_id]) 
    end 
    @task.update(content: params[:task] [:content])
    redirect_to user_path(params[ :user_id]) 
    flash[:notice] = "Successfully update..."
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    unless @task.destroy
        flash[:error] = "Error! Something went wrong..."
    end
        redirect_to  user_path(params[:user_id])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.permit(:content, :list_id)
    end
   
end
