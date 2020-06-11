class PublicController < ApplicationController
  def main
    @oppourtunities = Oppourtunity.latest
  end
end
