class AnnouncementsController < ApplicationController

  def recent_index
    Redis::SortedSet.new('System:recent_accouncements_index')
  end

  def submit
    #return login_required unless logged_in?
    #return render json: { status: 'Announcements can only be created by admins.' } unless is_admin?
    #post = Announcement.new_post(params[:message], current_username)
    #post.save
    render json: { status: 'ok' }
  end

  def delete
    #return login_required unless logged_in?
    #return render json: { status: 'Announcements can only be created by admins.' } unless is_admin?
    #Announcement.delete(params[:id])
    render json: { status: 'ok' }
  end

  def list
    #render json: { status: 'ok', list: Announcement.recent(0, 20) }
    render_json status: 'ok', list: object_store.get(Post, recent_index[0, 20])
  end

end