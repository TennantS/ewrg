module ApplicationHelper
  def action_is_edit_or_update?
    params[:action] == ("edit" || "update")    
  end
end
