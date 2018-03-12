class EventChannel < ApplicationCable::Channel
  def subscribed
    stream_from "event_#{params[:mail_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast("event_#{data['mail_id']}", data)
  end
end
