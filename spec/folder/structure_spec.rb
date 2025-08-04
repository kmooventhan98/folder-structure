# frozen_string_literal: true

RSpec.describe Folder::Structure do
  it "has a version number" do
    expect(Folder::Structure::VERSION).not_to be nil
  end

  it "prints the current directory structure" do
    expect(Folder::Structure.print_structure).to eq(Dir.pwd)
  end
end
