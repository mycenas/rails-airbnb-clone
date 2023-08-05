module ApplicationHelper
  def status_color_class(status)
    case status
    when 'accepted'
      'text-success'
    when 'declined'
      'text-danger'
    when 'pending'
      'text-primary'
    else
      ''
    end
  end
end
