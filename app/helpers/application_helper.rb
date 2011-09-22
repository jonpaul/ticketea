module ApplicationHelper
  def title(*attr)
    unless attr.empty?
      content_for :title do
        attr.join(" - ") unless attr.empty?
      end
    end
  end
end
