class NotesController < ApplicationController
    before_action :set_list, only: %i[ show edit update destroy ]
    
    # GET /notes
    def index
        @notes = Note.all.order("created_at DESC")
    end

    # GET /notes/new
    def new
        @note = Note.new
    end

    # POST /notes/new
    def create
        @note = Note.new(note_params)

        if @note.save
            redirect_to @note
        else
            render 'new'
        end
    end

    # GET /notes/1
    def show
    end

    # PATCH /notes/1
    def update
        if @note.update(note_params)
            redirect_to @note
        else
            render 'edit'
        end
    end

    # GET /notes/1/edit
    def edit
    end

    # DELETE /lists/1
    def destroy
        @note.destroy
        redirect_to notes_path
    end 

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
        @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
        params.require(:note).permit(:title, :content)
    end

end
