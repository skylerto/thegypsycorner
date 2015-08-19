class Artists::PortfoliosController < ApplicationController
  before_action :set_artists_portfolio, only: [:show, :edit, :update, :destroy]

  # GET /artists/portfolios
  # GET /artists/portfolios.json
  def index
    @artists_portfolios = Artists::Portfolio.all
  end

  # GET /artists/portfolios/1
  # GET /artists/portfolios/1.json
  def show
    @pieces = Artists::Piece.where(portfolio_id: params[:id])
  end

  # GET /artists/portfolios/new
  def new
    @artists_portfolio = Artists::Portfolio.new

  end

  # GET /artists/portfolios/1/edit
  def edit
  end

  # POST /artists/portfolios
  # POST /artists/portfolios.json
  def create
    @artists_portfolio = Artists::Portfolio.new(artists_portfolio_params)
@artists_portfolio.user_id = current_user.id
    respond_to do |format|
      if @artists_portfolio.save
        format.html { redirect_to @artists_portfolio, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @artists_portfolio }
      else
        format.html { render :new }
        format.json { render json: @artists_portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/portfolios/1
  # PATCH/PUT /artists/portfolios/1.json
  def update
    @artists_portfolio.user_id = current_user.id
    respond_to do |format|
      if @artists_portfolio.update(artists_portfolio_params)
        format.html { redirect_to @artists_portfolio, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @artists_portfolio }
      else
        format.html { render :edit }
        format.json { render json: @artists_portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/portfolios/1
  # DELETE /artists/portfolios/1.json
  def destroy
    @artists_portfolio.destroy
    respond_to do |format|
      format.html { redirect_to artists_portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artists_portfolio
      @artists_portfolio = Artists::Portfolio.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artists_portfolio_params
      params.require(:artists_portfolio).permit(:image, :title, :content, :user_id)
    end
end
