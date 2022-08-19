class EventsController < ApplicationController
  before_action :set_contact
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = current_user.events
  end

  def show
  end

  def new
    @event = Event.new(contact: @contact)
  end

  def create
    @event = Event.new(build_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to [@event.contact, @event], notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(build_params)
        format.html { redirect_to [@event.contact, @event], notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully deleted.' }
    end
  end

  private

  def set_contact
    @contact = current_user.contacts.find(params[:contact_id])
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end

  def build_params
    default_params.merge(event_params)
  end

  def default_params
    { contact_id: @contact.id }
  end

  def event_params
    params.fetch(:event, {}).permit(:contact_id, :title, :date, :notes)
  end
end
