class CsrsController < ApplicationController

  def index
    @csr_users = User.where(:roles => "CSR")
  end

  def new
  end

  def edit
  end

  def update
  end

  def delete
  end
end
