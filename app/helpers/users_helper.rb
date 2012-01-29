module UsersHelper
  def user_avatar
    if @user.provider == "facebook"
      image_tag("http://graph.facebook.com/"+@user.uid+"/picture?type=large")
    else
      image_tag ("https://api.twitter.com/1/users/profile_image?user_id=#{@user.uid}&size=original")
    end
  end
end
