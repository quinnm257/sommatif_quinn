class OrderAlbumsController < ApplicationController
  before_action :set_order_album, only: %i[ show edit update destroy ]

  # GET /order_albums or /order_albums.json
  def index
    @order_albums = OrderAlbum.all
  end

  # GET /order_albums/1 or /order_albums/1.json
  def show
  end

  # GET /order_albums/new
  def new
    @order_album = OrderAlbum.new
  end

  # GET /order_albums/1/edit
  def edit
  end

  # POST /order_albums or /order_albums.json
  def create
    @order_album = OrderAlbum.new(order_album_params)

    respond_to do |format|
      if @order_album.save
        format.html { redirect_to @order_album, notice: "Order album was successfully created." }
        format.json { render :show, status: :created, location: @order_album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_albums/1 or /order_albums/1.json
  def update
    respond_to do |format|
      if @order_album.update(order_album_params)
        format.html { redirect_to @order_album, notice: "Order album was successfully updated." }
        format.json { render :show, status: :ok, location: @order_album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_albums/1 or /order_albums/1.json
  def destroy
    @order_album.destroy!

    respond_to do |format|
      format.html { redirect_to order_albums_path, status: :see_other, notice: "Order album was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_album
      @order_album = OrderAlbum.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def order_album_params
      params.expect(order_album: [ :order_id, :album_copy_id ])
    end
end
