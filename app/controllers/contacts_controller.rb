class ContactsController < ApplicationController
  before_action :set_records, only: [:show, :edit, :update, :destroy]

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

  def set_records
    @contact = current_user.contacts.find(params[:id])
  end

  def build_params
    default_params.merge(contact_params)
  end

  def default_params
    { user: current_user }
  end

  def contact_params
    params.fetch(:contact, {}).permit(:user_id, :name, :image, :company, :location, :email, :phone, :website, :twitter, :notes)
  end
end
