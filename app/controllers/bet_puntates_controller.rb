class BetPuntatesController < ApplicationController
  before_action :set_bet_puntate, only: [:index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /bet_puntates
  # GET /bet_puntates.json
  def index
    $schedina = nil
    @chiusura = false
    @quota_totale = 1
    @controlla_chiusura = BetPuntate.where(:user_id => current_user.id)
    @controlla_chiusura.each do |controlla|
      #if !controlla.chiusura
        #@chiusura = true
        @chiusura = controlla.chiusura
        if controlla.evento_scommesso == "s"
          @quota_totale = (@quota_totale * controlla.bet(controlla.bet_id)[:sconfitta]) 
        end
        if controlla.evento_scommesso == "v"
          @quota_totale = (@quota_totale * controlla.bet(controlla.bet_id)[:vittoria]) 
        end
        if controlla.evento_scommesso == "p"
          @quota_totale = (@quota_totale * controlla.bet(controlla.bet_id)[:pareggio]) 
        end
      #end
    end

    #debugger

  end


  def show
  end

  def new
  end

  def edit
  end


  def create
    @bet_puntate = BetPuntate.new
    @bet_puntate.user_id = params[:c_u]
    @bet_puntate.bet_id = params[:bet]
    @bet_puntate.evento_scommesso = params[:evento_scommesso]
    $bet_puntate = nil
    respond_to do |format|
      if @bet_puntate.save
        $bet_puntate = BetPuntate.find_by bet_id: @bet_puntate.bet_id
        format.html { redirect_to bets_path, notice: 'L ''evento è stato aggiunto alla tua schedina.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
          if BetPuntate.where(:user_id => bet_puntate_params[:user_id]).update_all(chiusura: 'true')
            format.html { redirect_to bet_puntates_path, notice: 'Bet puntate was successfully updated.' }
          else
            format.html { render :edit }
          end
    end
  end


  def destroy
    @bet_puntate.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to bet_puntates_url, notice: 'Bet puntate was successfully destroyed.' }
    end
  end

  private
    def set_bet_puntate
      #@bet_puntates = BetPuntate.where("created_at", params[:bet_data])
      if action_name != 'destroy'
        @bet_puntates = BetPuntate.where("user_id = #{current_user.id}") 
      else
        @bet_puntates = BetPuntate.where("id= #{params[:id]}")
        @bet_puntate = BetPuntate.where("id= #{params[:id]}")    
      end
    end



    def bet_puntate_params
      params.require(:bet_puntate).permit(:user, :bet, :evento_scommesso, :user_id, :chiusura, :id)
    end
end
