class PagesController < ApplicationController

  def index
  end

  def health
    TestWorker.perform_async("hello world!")
    render json: {ok: true}
  end

end
