class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy, :download]
  before_action :find_parent, except: [:index, :download]

  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new(:ticket => @ticket)
    render :layout => false
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.ticket = @ticket
    @attachment.user = current_user
    respond_to do |format|
      if @attachment.save
        format.html { redirect_to @ticket, notice: 'Attachment was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to request.env['HTTP_REFERER'], notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    send_file @attachment.file.path, :type => @attachment.file_content_type, :filename => @attachment.file_file_name
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    def find_parent
      @ticket = Ticket.find(params[:ticket_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:description, :file)
    end
end
