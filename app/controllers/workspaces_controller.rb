class WorkspacesController < ApplicationController
  def index
    @workspaces = current_user.workspaces
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = current_user.workspaces.new(workspace_params)
  
    if @workspace.save
      redirect_to @workspace, notice: 'Workspace was successfully created.'
    else
      render :new
    end
  end

  def show
    @workspace = Workspace.find(params[:id])
    @notes = @workspace.notes
    @lists = @workspace.lists
  end
  
  def edit
    @workspace = Workspace.find(params[:id])
  end
  
  def update
    @workspace = Workspace.find(params[:id])
  
    if @workspace.update(workspace_params)
      redirect_to @workspace, notice: 'Workspace was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy
    redirect_to workspaces_path, notice: 'Workspace was successfully deleted.'
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name, :description, :visibility, :deadline) 
  end

end
