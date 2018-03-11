class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :resend]

  # GET /mails
  # GET /mails.json
  def index
    @emails = Email.all
  end

  # GET /mails/1
  # GET /mails/1.json
  def show
  end

  # GET /mails/new
  def new
    @email = Email.new
  end

  # POST /mails
  # POST /mails.json
  def create
    @email = Email.new(email_params)

    respond_to do |format|
      if @email.save
        SendMailWorker.perform_async(@email.id)
        format.html { redirect_to @email, notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def resend
    SendMailWorker.perform_async(@email.id)
    redirect_to :emails, notice: "Resending email ##{@email.id}."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:from, :to, :subject, :content)
    end
end
