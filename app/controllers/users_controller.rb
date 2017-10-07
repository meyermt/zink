class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params['name']
    @user.username = params['username']
    @user.email = params['email']
    @user.password = params['password']
    @user.password_confirmation = params['password_confirmation']
    if @user.save
      redirect_to "/sessions/new", notice: "Thanks for signing up!"
    else
      render 'new', notice: "Unable to add you as a new user. Please try again."
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "You need to login first."
    end
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "You need to login first."
    end
    @user.username = params['username']
    @user.email = params['email']
    @user.name = params['name']
    if @user.save
      @user = User.find_by(id: session[:user_id])
      redirect_to "/users/#{@user.id}", notice: "Profile successfully updated."
    else
      @student_delegate = false
      render 'edit'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "You are not authorized to view that page."
    end
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "You are not authorized to view that page."
    end
    if @user.destroy
      redirect_to root_url, notice: "Sorry to see you go, but thanks for zinking with us!"
    end
  end

end
