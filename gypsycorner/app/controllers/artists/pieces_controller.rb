class Artists::PiecesController < ApplicationController
  before_action :set_artists_piece, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  # GET /artists/pieces
  # GET /artists/pieces.json
  def index
    @artists_pieces = Artists::Piece.where(user_id: current_user.id)
    @portfolios = Artists::Portfolio.where(user_id: current_user.id)
  end

  # GET /artists/pieces/1
  # GET /artists/pieces/1.json
  def show
  end

  # GET /artists/pieces/new
  def new
    @artists_piece = Artists::Piece.new
    @portfolios = Artists::Portfolio.where(user_id: current_user.id)
  end

  # GET /artists/pieces/1/edit
  def edit
    @portfolios = Artists::Portfolio.where(user_id: current_user.id)
  end

  # POST /artists/pieces
  # POST /artists/pieces.json
  def create
    @artists_piece = Artists::Piece.new(artists_piece_params)
    @artists_piece.user_id = current_user.id
    @portfolios = Artists::Portfolio.where(user_id: current_user.id)
    respond_to do |format|
      if @artists_piece.save
        format.html { redirect_to @artists_piece, notice: 'Piece was successfully created.' }
        format.json { render :show, status: :created, location: @artists_piece }
      else
        format.html { render :new }
        format.json { render json: @artists_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/pieces/1
  # PATCH/PUT /artists/pieces/1.json
  def update
    @portoflios = Artists::Portfolio.where(user_id: current_user.id)
    respond_to do |format|
      @artists_piece.user_id = current_user.id
      if @artists_piece.update(artists_piece_params)
        format.html { redirect_to @artists_piece, notice: 'Piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @artists_piece }
      else
        format.html { render :edit }
        format.json { render json: @artists_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/pieces/1
  # DELETE /artists/pieces/1.json
  def destroy
    @artists_piece.destroy
    respond_to do |format|
      format.html { redirect_to artists_pieces_url, notice: 'Piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artists_piece
      @artists_piece = Artists::Piece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artists_piece_params
      params.require(:artists_piece).permit(:image, :title, :content, :user_id, :portfolio_id)
    end
end
