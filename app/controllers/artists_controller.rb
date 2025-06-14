class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[ show edit update destroy ]

  # GET /artists or /artists.json
  def index
    @artists = Artist.paginate(page: params[:page], per_page: 20)
  end

  # GET /artists/1 or /artists/1.json
  def show
  end

  # GET /artists/new
  def new
    @artist = Artist.new
    authorize @artist
  end

  # GET /artists/1/edit
  def edit
    authorize @artist
  end

  # POST /artists or /artists.json
  def create
    authorize @artist
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: "Artist was successfully created." }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1 or /artists/1.json
  def update
    authorize @artist
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: "Artist was successfully updated." }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1 or /artists/1.json
  def destroy
    authorize @artist
    @artist.destroy!

    respond_to do |format|
      format.html { redirect_to artists_path, status: :see_other, notice: "Artist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      params.expect(artist: [ :name, :biography, :debut_year, :country ])
    end
end
