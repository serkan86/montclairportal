class MessagesController < ApplicationController
  def index
    add_breadcrumb 'Messages', messages_path
    user_ids = current_user.messages.map(&:received_messageable_id) + current_user.messages.map(&:sent_messageable_id)
    user_ids.delete(current_user.id)
    @users = User.find(user_ids).uniq
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      current_user.received_messages.where('sent_messageable_id = ?', params[:user_id]).unreaded.map{|m| m.mark_as_read}
      user = User.find(params[:user_id])
      @messages = current_user.messages.where('received_messageable_id = :user_id OR sent_messageable_id = :user_id', user_id: user.id)
    else
      if current_user.received_messages.first.present?
        su = current_user.received_messages.first
        redirect_to messages_path(user_id: su.sent_messageable_id == current_user.id ? su.received_messageable_id : su.sent_messageable_id)
      end
    end
  end

  def create
    received_messageable = User.find(message_params[:received_messageable_id])
    current_user.send_message(received_messageable, message_params[:body])
    redirect_to messages_path(user_id: message_params[:received_messageable_id])
  end

  def destroy

  end

  private
  def message_params
    params.require(:acts_as_messageable_message).permit(:received_messageable_id, :body)
  end
end