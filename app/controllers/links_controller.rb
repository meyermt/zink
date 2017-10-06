class LinksController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "You need to login before creating links."
    end
    # at some point this method becomes a major problem, as it will be harder to be unique
    uuid = SecureRandom.uuid[0...8]
    while Link.find_by(uuid: uuid) != nil do
      uuid = SecureRandom.uuid[0...8]
    end

    link = Link.new
    link.uuid = uuid
    link.redirect = params['redirect']
    link.count = 0
    if link.save
       redirect_to "/users/#{@user.id}", notice: "Link Added! Link is localhost:3000/links/#{uuid}"
    else
       render 'new', notice: 'Unable to add link for you. Please try again.'
    end
  end

  def show
    redirect = Link.find_by(uuid: params['uuid']).redirect
    redirect_to "#{redirect}"
  end

  def destroy
  end

end
