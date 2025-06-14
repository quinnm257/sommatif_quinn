class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]

  # GET /albums or /albums.json
  def index
    if params[:album_id].present?
      @albums = Album.where(id: params[:album_id]).paginate(page: params[:page], per_page: 10)
    elsif params[:artist_id].present?
      @albums = Album.where(artist_id: params[:artist_id]).paginate(page: params[:page], per_page: 10)
    elsif params[:genre_id].present?
      @albums = Album.where(genre_id: params[:genre_id]).paginate(page: params[:page], per_page: 10)
    else
      @albums = Album.paginate(page: params[:page], per_page: 10)
    end
  end

 

  # GET /albums/1 or /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
    @artist = Artist.all
    @genre = Genre.all
    authorize @album
  end

  # GET /albums/1/edit
  def edit
    @artist = Artist.all
    @genre = Genre.all
    authorize @album
  end

  # POST /albums or /albums.json
  def create
    authorize @album
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    @album.destroy!

    respond_to do |format|
      format.html { redirect_to albums_path, status: :see_other, notice: "Album was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.expect(album: [ :title, :artist_id, :release_year, :genre_id ])
    end

     private

      def set_artists
        @artists = Artist.all
        @genres = Genre.all
      end
end
