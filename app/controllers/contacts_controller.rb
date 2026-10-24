class ContactsController < ApplicationController
  
  before_action :set_contact, only: %i[ show edit update destroy ] 
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @contacts = Contact.all 
  end

  def show
  end

  def new
   @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact
    else
     render :new, status: :unprocessable_entity
    end
  end

  def edit
  end 

  def update
    if @contact.update(contact_params)
      redirect_to @contact
    else  
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    puts "Why tf puts?"
    @contact.destroy
    redirect_to contacts_path
  end

  private
    def set_contact 
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.expect(contact: [ :name, :phone, :email ])
    end
end
