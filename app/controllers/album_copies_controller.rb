class AlbumCopiesController < ApplicationController
  before_action :set_album_copy, only: %i[ show edit update destroy ]

  # GET /album_copies or /album_copies.json
  def index
    @album_copies = AlbumCopy.all
  end

  # GET /album_copies/1 or /album_copies/1.json
  def show
  end

  # GET /album_copies/new
  def new
    @album_copy = AlbumCopy.new
    @album = Album.all
    authorize @album_copy
  end

  # GET /album_copies/1/edit
  def edit
    @album = Album.all
    authorize @album_copy
  end

  # POST /album_copies or /album_copies.json
  def create
    @album_copy = AlbumCopy.new(album_copy_params)
    authorize @album_copy

    respond_to do |format|
      if @album_copy.save
        format.html { redirect_to @album_copy, notice: "Album copy was successfully created." }
        format.json { render :show, status: :created, location: @album_copy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album_copy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_copies/1 or /album_copies/1.json
  def update
    authorize @album_copy
    respond_to do |format|
      if @album_copy.update(album_copy_params)
        format.html { redirect_to @album_copy, notice: "Album copy was successfully updated." }
        format.json { render :show, status: :ok, location: @album_copy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album_copy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_copies/1 or /album_copies/1.json
  def destroy
    @album_copy.destroy!
    authorize @album_copy
    respond_to do |format|
      format.html { redirect_to album_copies_path, status: :see_other, notice: "Album copy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_copy
      @album_copy = AlbumCopy.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def album_copy_params
      params.expect(album_copy: [ :album_id, :media_type, :condition, :price ])
    end
end
