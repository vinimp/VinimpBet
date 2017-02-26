class BetPuntatesController < ApplicationController
  before_action :set_bet_puntate, only: [:index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:schedine]

  def schedine
    @classifica = Classifica.order('punteggio DESC')
    @settimana = BetPuntate.order('n_giornata DESC', 'user_id ASC')
    @utente = User.all
    @schedine = BetPuntate.where(n_giornata: @settimana[0].n_giornata, user_id: User.distinct).order('user_id ASC')

    #@schedine = User.where(id: BetPuntate.where(n_giornata: @settimana[0].n_giornata))



  end

  def index
    $schedina = nil
    @chiusura = false
    @quota_totale = 1
    @controlla_chiusura = BetPuntate.where(:user_id => current_user.id, n_giornata: @ngiornata[0].n_giornata)
    if @controlla_chiusura.count > 0 
      @controlla_chiusura.each do |controlla|
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
      end
    end
  end


  def show
  end

  def new
  end

  def edit
  end


  def create
    @controllo = BetPuntate.where(bet_id: params[:bet], user_id: params[:c_u])
    if @controllo.count ==0
      @controllo_scommessa_piazzata = BetPuntate.where(user_id: params[:c_u]).order('n_giornata DESC')
      @bet_puntate = BetPuntate.new
      @bet_puntate.user_id = params[:c_u]
      @bet_puntate.bet_id = params[:bet]
      @bet_puntate.evento_scommesso = params[:evento_scommesso]
      @ngiornata = Bet.order('n_giornata DESC') 

debugger

      if @ngiornata[0].n_giornata == @controllo_scommessa_piazzata[0].n_giornata
        if !@ngiornata[0].chiudi_concorso && !@controllo_scommessa_piazzata[0].chiusura
          @bet_puntate.n_giornata = @ngiornata[0].n_giornata
          respond_to do |format|
            if @bet_puntate.save
              $bet_puntate = BetPuntate.find_by bet_id: @bet_puntate.bet_id
              format.html { redirect_to bets_path, notice: 'L ''evento è stato aggiunto alla tua schedina.' }
            else
              format.html { render :new }
            end
          end
        else
          respond_to do |format|
            format.html { redirect_to bets_path, notice: 'Già hai piazzato la tua scommessa' }
          end
        end
      else
        @bet_puntate.n_giornata = @ngiornata[0].n_giornata
        respond_to do |format|
          if @bet_puntate.save
            $bet_puntate = BetPuntate.find_by bet_id: @bet_puntate.bet_id
            format.html { redirect_to bets_path, notice: 'L ''evento è stato aggiunto alla tua schedina.' }
          else
            format.html { render :new }
          end 
        end 
      end 
    else
       redirect_to bets_path, notice: 'L ''evento è già presente nella tua schedina.' 
    end
  end


  def update
    respond_to do |format|
          if BetPuntate.where(:user_id => bet_puntate_params[:user_id]).update_all(chiusura: 'true')
            format.html { redirect_to bet_puntates_path, notice: 'La tua scommessa è stata aggiornata.' }
          else
            format.html { render :edit }
          end
    end
  end


  def destroy
    @bet_puntate.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to bet_puntates_url, notice: 'La tua scommessa è stata eliminata.' }
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
      @ngiornata = Bet.order('n_giornata DESC')   
    end



    def bet_puntate_params
      params.require(:bet_puntate).permit(:user, :bet, :evento_scommesso, :user_id, :chiusura, :id)
    end
end
