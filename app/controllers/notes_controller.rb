class NotesController < ApplicationController
    before_action :set_workspace, only: [:index, :create, :new, :show, :edit, :update, :destroy]
    before_action :set_note, only: %i[ show edit update destroy ]

    
    # GET /notes
    def index
        @notes = @workspace.notes.order("created_at DESC")
    end

    # GET /notes/new
    def new
        @note = @workspace.notes.new
    end

    # POST /notes/new
    def create
        @note = @workspace.notes.new(note_params)

        if @note.save
            redirect_to workspace_note_path(@workspace, @note)
        else
            render 'new'
        end
    end

    # GET /notes/1
    def show
    end

    # GET /notes/1/edit
    def edit
    end
    
    # PATCH /notes/1
    def update
        if @note.update(note_params)
            redirect_to workspace_note_path(@workspace, @note)
        else
            render 'edit'
        end
    end

    # DELETE /lists/1
    def destroy
        @note.destroy
        redirect_to workspace_notes_path(@workspace)
    end 

    private

    def set_workspace
        @workspace = Workspace.find(params[:workspace_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_note
        @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
        params.require(:note).permit(:title, :content)
    end

end
