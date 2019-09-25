class PagesController < ApplicationController

  def index
  end

  def health
    render json: {
      version: Git::VERSION,
      revision: Git::REVISION
    }
  end

end
