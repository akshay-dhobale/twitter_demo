class RelationsController < ApplicationController
  def create
  @relation = current_user.relations.build(:friend_id => params[:friend_id])
  if @relation.save
    flash[:notice] = "Added friend."
    redirect_to root_url
  else
    flash[:error] = "Unable to add friend."
    redirect_to root_url
  end
end


def destroy
  @relation = current_user.relations.find(params[:id])
  @relation.destroy
  flash[:notice] = "Removed friendship."
  redirect_to current_user
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation
      @relation = Relation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_params
      params.require(:relation).permit(:user_id, :friend_id)
    end
end
