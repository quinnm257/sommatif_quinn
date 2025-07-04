class AlbumTracksController < ApplicationController
  before_action :set_album_track, only: %i[ show edit update destroy ]

  # GET /album_tracks or /album_tracks.json
  def index
    if params[:album_id].present?
      @album = Album.find_by(id: params[:album_id])
      @album_tracks = AlbumTrack.where(album_id: params[:album_id])
    else
      @album_tracks = AlbumTrack.all
    end
  end

  

  # GET /album_tracks/1 or /album_tracks/1.json
  def show
    authorize @album_track
  end

  # GET /album_tracks/new
  def new
    @album_track = AlbumTrack.new
    @album = Album.all
    authorize @album_track
  end

  # GET /album_tracks/1/edit
  def edit
    @album = Album.all
    authorize @album_track
  end

  # POST /album_tracks or /album_tracks.json
  def create
    @album_track = AlbumTrack.new(album_track_params)
    authorize @album_track

    respond_to do |format|
      if @album_track.save
        format.html { redirect_to @album_track, notice: "Album track was successfully created." }
        format.json { render :show, status: :created, location: @album_track }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_tracks/1 or /album_tracks/1.json
  def update
    authorize @album_track
    respond_to do |format|
      if @album_track.update(album_track_params)
        format.html { redirect_to @album_track, notice: "Album track was successfully updated." }
        format.json { render :show, status: :ok, location: @album_track }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_tracks/1 or /album_tracks/1.json
  def destroy
    authorize @album_track
    @album_track.destroy!

    respond_to do |format|
      format.html { redirect_to album_tracks_path, status: :see_other, notice: "Album track was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_track
      @album_track = AlbumTrack.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def album_track_params
      params.expect(album_track: [ :album_id, :track_name, :track_number ])
    end
end
