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
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
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
