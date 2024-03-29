class Public::ConferenceFeedbacksController < Public::ApplicationController
  def index
    @conference = current_conference
    @unrated_events = @conference.events
      .joins(:proposition).approved
      .joins("LEFT JOIN feedbacks ON feedbacks.feedback_receiving_id = events.id AND feedbacks.feedback_receiving_type = 'Event'")
      .where("feedbacks.session_id != ? OR feedbacks.id IS NULL", session.id.to_s).distinct

    @rated_events = @conference.events
      .joins(:proposition).approved
      .joins(:feedbacks)
      .where(feedbacks: {session_id: session.id.to_s}).distinct
  end

  def new
    if current_conference.feedbacks.where(session_id: session.id.to_s).exists?
      @feedback = current_conference.feedbacks.where(session_id: session.id.to_s).order(updated_at: :asc).last
    else
      @feedback = current_conference.feedbacks.build
      @feedback.author_email = Feedback.where(session_id: session.id.to_s).order(updated_at: :asc).last.try(:author_email)
    end
  end

  def create
    @feedback = current_conference.feedbacks.build(feedback_params)
    @feedback.ip_address = request.remote_ip
    @feedback.session_id = session.id.to_s

    if @feedback.save
      flash[:notice] = I18n.t("public.conference_feedbacks.new.success")
      redirect_to conference_feedbacks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:author_email, :rating, :comment)
  end
end
