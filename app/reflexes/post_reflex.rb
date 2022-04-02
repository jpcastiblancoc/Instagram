# frozen_string_literal: true

class PostReflex < ApplicationReflex

  def delete
    Post.find(element.dataset[:step].to_i).destroy
  end

end
