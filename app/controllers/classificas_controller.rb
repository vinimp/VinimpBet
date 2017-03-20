class ClassificasController < ApplicationController
  before_action :set_classifica, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @ngiornata = Classifica.order('created_at DESC')

    if @ngiornata.count != 0 
      @classificas = Classifica.where(n_giornata: @ngiornata[0].n_giornata).order('punteggio DESC')
    else
      @classificas = Classifica.all
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    aggiorna_classifica
    @classifica = Classifica.last
    respond_to do |format|
      format.html { redirect_to @classifica, notice: 'Classifica was successfully created.' }
    end
  end


  def update
    respond_to do |format|
      if @classifica.update(classifica_params)
        format.html { redirect_to @classifica, notice: 'Classifica was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @classifica.destroy
    respond_to do |format|
      format.html { redirect_to classificas_url, notice: 'Classifica was successfully destroyed.' }
    end
  end

  private
    def set_classifica
      @classifica = Classifica.find(params[:id])
    end

    def classifica_params
      params.require(:classifica).permit(:user_id, :n_giornata, :punteggio)
    end

  def aggiorna_classifica
    @azzeccato = false
    @giocatori =  User.all  

    @giocatori.each do |g|
      @continua_ciclo = true
      @n_giornata = BetPuntate.maximum("n_giornata")
      @puntata = BetPuntate.where(:user_id => g.id, n_giornata: @n_giornata)
      @utente_id = g.id
      @quota_scommessa = 1
      @puntata.each do |p|
        @evento = Bet.find(p.bet_id)
        if p.chiusura 
          @classifica = Classifica.find_by(user_id: g.id)



          if (p.evento_scommesso == @evento.risultato) and (@continua_ciclo)
            @azzeccato = true
            if p.evento_scommesso == "v"      
              if !@azzeccato.nil? 
                @quota_scommessa = (@quota_scommessa * @evento.vittoria) + @classifica.punteggio
              else
                @quota_scommessa = (@quota_scommessa * @evento.vittoria)
              end    
            end
            if p.evento_scommesso == "p"
              if !@azzeccato.nil? 
                @quota_scommessa = (@quota_scommessa * @evento.pareggio) + @classifica.punteggio
              else
                @quota_scommessa = (@quota_scommessa * @evento.pareggio)
              end                 
            end      
            if p.evento_scommesso == "s"
              if !@azzeccato.nil? 
                @quota_scommessa = (@quota_scommessa * @evento.sconfitta) + @classifica.punteggio
              else
                @quota_scommessa = (@quota_scommessa * @evento.sconfitta)
              end                 
            end              
          else
            @continua_ciclo = false
            @quota_scommessa = 0
            @azzeccato = false
          end    
        else
          @quota_scommessa = 0          
          if (@classifica = Classifica.find_by(user_id: g.id))
            @quota_scommessa = @quota_scommessa + @classifica.punteggio
            @azzeccato = true
          end
        end
      end     
        Classifica.create(user_id: @utente_id, n_giornata: @evento.n_giornata, punteggio: @quota_scommessa)        
    end
  end
end