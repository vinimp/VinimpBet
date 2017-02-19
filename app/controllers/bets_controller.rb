class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @appoggio = Bet.order('n_giornata DESC').limit(10)
    @bets = Bet.all.order('n_giornata DESC').paginate(:page => params[:page], :per_page => 10)
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
        format.html { redirect_to @bet, notice: 'L ''evento è stato aggiunto alla tua schedina.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if bet_params[:chiudi_concorso] == "true"
        @appoggio = Bet.find_by(id: bet_params[:id])
        #@appoggio.each do |appo|
          if @appoggio.update(bet_params)
            format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
          else
            format.html { render :edit }
          end          

        #end
      end

      #if @bet.update(bet_params)
      #  format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
      #else
      #  format.html { render :edit }
      #end
    end
  end

  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
    end
  end

  private
    def set_bet
      @bet = Bet.find(params[:id])
      @bet_puntate = BetPuntate.find_by(params[:id])
    end

    def bet_params
      params.require(:bet).permit(:id, :evento, :vittoria, :pareggio, :sconfitta, :data, :logo_in, :logo_out, :n_giornata, :chiudi_concorso, :risultato)
    end

    def check_user
      if current_user != @bet.user 
        redirect_to root_url, alert: "Scusa ma non ai accesso a questa pagina"
      end
    end
end
