class LinksController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "You need to login before creating links."
    end
    # at some point this method becomes a major problem, as it will be harder to be unique
    uuid = SecureRandom.uuid[0...5]
    while Link.find_by(uuid: uuid) != nil do
      uuid = SecureRandom.uuid[0...5]
    end

    link = Link.new
    link.uuid = uuid
    link.redirect = params['redirect']
    link.count = 0
    link.user_id = @user.id
    if link.save
       redirect_to "/users/#{@user.id}", notice: "Link Added! Link is localhost:3000/z/#{uuid}"
    else
       render 'new', notice: 'Unable to add link for you. Please try again.'
    end
  end

  def show
    link = Link.find_by(uuid: params['uuid'])
    link.count = link.count + 1
    link.last = Time.now.to_s
    link.save
    redirect_to "#{link.redirect}"
  end

  def destroy
  end

end
