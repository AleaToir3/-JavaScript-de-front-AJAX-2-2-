class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html { redirect_to :index }
      format.js { }
    end
  end
  
  def create
    @email = Email.create(object: Faker::Book.title, body: Faker::Lorem.paragraph_by_chars(number: 60, supplemental: false))

    respond_to do |format|
      format.html { redirect_to :index }
      format.js { }
    end
  end
  
  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to :index }
      format.js {}
    end
  end
  def edit
    @email = Email.find(params[:id])
    if @email.read
      @email.update(read: false)
    else
      @email.update(read: true)
    end
  
    respond_to do |format|
      format.html { redirect_to :index }
      format.js {}
    end
  end
  
  
end
