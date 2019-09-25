class PagesController < ApplicationController

  def index
  end

  def health
    logger.error "hello", name: "john", age: 10
    render json: {
      version: Git::VERSION,
      revision: Git::REVISION
    }
  end

end
