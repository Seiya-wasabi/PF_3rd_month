class HomesController < ApplicationController
  def top
  end

  def index
    @rents = RealProperty.page(params[:page]).reverse_order
    @all_ranks = Note.find(Like.group(:note_id).order('count(note_id) desc').limit(3).pluck(:note_id))
  end
end