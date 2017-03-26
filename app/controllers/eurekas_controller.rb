class EurekasController < ApplicationController
  before_action :set_eureka, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :bilancio_edit, :show]

  def bilancio_edit
    #@bilancio = Eureka.first
    @bilancio = Eureka.find_by(id: params[:format])
  end

  def bilancio
    #@bilancio = Eureka.all.order('id DESC')
    @bilancio = Eureka.all.order('id DESC').paginate(:page => params[:page], :per_page => 10)
    @vincita_spesa = 0
    @bilancio.each do |bil|
      if !bil.vincita.nil?
        @vincita_spesa = @vincita_spesa + bil.vincita - bil.puntata11 - bil.puntata1x - bil.puntatax - bil.puntata2
      else
        @vincita_spesa = @vincita_spesa - bil.puntata11 - bil.puntata1x - bil.puntatax - bil.puntata2
      end
    end   
  end

  def index
    #@eurekas = Eureka.all
    @eurekas = Eureka.all.order('id DESC').paginate(:page => params[:page], :per_page => 1)

    if !@eurekas[0].nil?
      @spesa_corrente = (@eurekas[0].puntata11).to_f + (@eurekas[0].puntata1x).to_f + (@eurekas[0].puntatax).to_f + (@eurekas[0].puntata2).to_f
    end
  end

  def show
  end

  def new
    @eureka = Eureka.new
  end

  def edit
    @eureka = Eureka.find_by(id: params[:id])
  end

  def create
    @eureka = Eureka.new(eureka_params)
    respond_to do |format|
      if @eureka.save        
        format.html { redirect_to @eureka, notice: 'Eureka was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @eureka.update(eureka_params)
        format.html { redirect_to @eureka, notice: 'Eureka was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @eureka.destroy
    respond_to do |format|
      format.html { redirect_to eurekas_url, notice: 'Eureka was successfully destroyed.' }
    end
  end

  private
    def set_eureka
      @eureka = Eureka.find(params[:id])
    end

    def eureka_params
      params.require(:eureka).permit(:evento1, :evento2, :unouno, :unox, :x, :due, :puntata11, :puntata1x, :puntatax, :puntata2,
        :data, :spesa, :vincita, :spesa_totale, :vincita_totale)
    end
end
