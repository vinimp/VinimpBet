class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @bets = Bet.all
  end

  def show
  end

  def new
    @bet = current_user.bets.build
  end

  def edit
  end

  def create
    @bet = current_user.bets.build(bet_params)

    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bet
      @bet = Bet.find(params[:id])
    end

    def bet_params
      params.require(:bet).permit(:evento, :vittoria, :pareggio, :sconfitta, :data, :logo_in, :logo_out)
    end

    def check_user
      if current_user != @bet.user 
        redirect_to root_url, alert: "Scusa ma non ai accesso a questa pagina"
      end
    end
end
