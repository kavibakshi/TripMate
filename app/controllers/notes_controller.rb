class NotesController < ApplicationController

    def index
        @note = Note.all
    end

    def new
        @note = Note.new
    end

    def create
        @note = Note.new(note_params)

        if @note.save
            redirect_to @note
        else
            render 'new'
        end
    end

    def show
        @note = Note.find(params[:id])
    end
    
    private

    def note_params
        params.require(:note).permit(:title, :content)
    end

end
