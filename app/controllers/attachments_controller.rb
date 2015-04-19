# encoding: UTF-8
class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show]
  add_breadcrumb 'Attachments', :attachments_path
  def index
    @search = Attachment.order('id DESC').search(params[:q])
     @attachments = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@attachments)
  end

  def show
    add_breadcrumb @attachment.title, attachment_path(@attachment)
    respond_with(@attachment)
  end

  def new
    add_breadcrumb t('tooltips.new'), new_attachment_path
    @attachment = Attachment.new
    respond_with(@attachment)
  end

  def edit
    @attachment = current_user.attachments.find(params[:id])
    add_breadcrumb @attachment.id, attachment_path(@attachment)
    add_breadcrumb t('tooltips.edit'), edit_attachment_path
  end

  def create
    @attachment = current_user.attachments.new(attachment_params)
    @attachment.save
    respond_with(@attachment)
  end

  def update
    @attachment = current_user.attachments.find(params[:id])
    @attachment.update(attachment_params)
    respond_with(@attachment)
  end

  def destroy
    @attachment = current_user.attachments.find(params[:id])
    @attachment.destroy
    respond_with(@attachment)
  end

  private

  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(:description, :title, :file)
  end
end
