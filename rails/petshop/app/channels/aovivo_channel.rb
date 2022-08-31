class AovivoChannel < ApplicationCable::Channel
  def subscribed
    usuario = Usuario.find(params[:usuario_id])

    aovivo_subs = AovivoSubscribe.where(usuario_id: params[:usuario_id]).first
    if aovivo_subs.blank?
      aovivo_subs = AovivoSubscribe.new
    end

    aovivo_subs.usuario_id = params[:usuario_id]
    aovivo_subs.tipo_campeonato = params[:tipo_campeonato]
    aovivo_subs.updated_at = Time.zone.now
    aovivo_subs.save

    stream_for usuario
  end

  def unsubscribed
    AovivoSubscribe.where(usuario_id: params[:usuario_id]).destroy_all
  end
end
