class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_contact

  def index
    @contacts = current_user.contacts
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(build_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(build_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully deleted.' }
    end
  end

  private

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def build_params
    default_params.merge(contact_params)
  end

  def default_params
    { user: current_user }
  end

  def contact_params
    params.fetch(:contact, {}).permit(:user_id, :name, :company, :location, :email, :phone, :website, :twitter, :notes)
  end

  def invalid_contact
    redirect_to contacts_path, alert: "Invalid Contact"
  end
end
