require "emd/version"
require "thor"

module Emd

  class Engine < ::Rails::Engine
  end

  class Base < Thor

    desc :test, 'test this'
    # method_option :group, type: :boolean, aliases: '-g'
    # method_option :load, type: :string, aliases: '-l'
    # method_option :save, type: :string, aliases: '-s'
    # method_option :force, type: :boolean, aliases: '-f'

    def test(arg = nil)
      puts "test"
    end

  end
end
