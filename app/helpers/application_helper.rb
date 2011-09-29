module ApplicationHelper
  def title(*attr)
    unless attr.empty?
      content_for :title do
        attr.join(" - ") unless attr.empty?
      end
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end
end
