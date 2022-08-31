class AvivoSubscribesController < ApplicationController
  before_action :set_avivo_subscribe, only: %i[ show update destroy ]

  # GET /avivo_subscribes
  def index
    @avivo_subscribes = AvivoSubscribe.all

    render json: @avivo_subscribes
  end

  # GET /avivo_subscribes/1
  def show
    render json: @avivo_subscribe
  end

  # POST /avivo_subscribes
  def create
    @avivo_subscribe = AvivoSubscribe.new(avivo_subscribe_params)

    if @avivo_subscribe.save
      render json: @avivo_subscribe, status: :created, location: @avivo_subscribe
    else
      render json: @avivo_subscribe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /avivo_subscribes/1
  def update
    if @avivo_subscribe.update(avivo_subscribe_params)
      render json: @avivo_subscribe
    else
      render json: @avivo_subscribe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /avivo_subscribes/1
  def destroy
    @avivo_subscribe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avivo_subscribe
      @avivo_subscribe = AvivoSubscribe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def avivo_subscribe_params
      params.require(:avivo_subscribe).permit(:usuario_id_id, :tipo_campeonato)
    end
end
