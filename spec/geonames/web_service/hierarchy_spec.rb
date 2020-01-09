require 'spec_helper'

module Geonames
  describe WebService do
    describe ".hierarchy" do
      subject { described_class.hierarchy(geonameId) }

      let(:geonameId)  { 2657896 }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/hierarchy?geonameId=2657896&lang=en" }
      let(:fixture_folder) { "hierarchy" }
      let(:fixture_file)   { "zurich.xml" }

      it { should be_a_kind_of(Array) }

      it "returns Toponym instances" do
        subject.each do |element|
          element.should be_a_kind_of Toponym
        end
      end
    end
  end
end
