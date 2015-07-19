class CandidatesController < ApplicationController
  before_action :set_candidate, only: :show

  def show
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        SendMailsWorker.perform_async(@candidate.id)
        format.html { redirect_to @candidate, notice: I18n.t("candidate.successful") }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:name, :email, :html_score, :css_score, :javascript_score, :python_score, :django_score, :ios_score, :android_score)
    end

    # def send_emails
    #   mails = []
    #   mails << "front_end" if @candidate.front_end?
    #   mails << "back_end" if @candidate.back_end?
    #   mails << "mobile" if @candidate.mobile?
    #   mails << "generic" if mails.blank?
    #
    #   mails.each do |mail|
    #     CandidateMailer.try(mail, @candidate).deliver_now
    #   end
    # end
end
