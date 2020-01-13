require 'spec_helper'

module Geonames
  describe WebService do
    describe ".find_bounding_box_wikipedia" do
      subject { described_class.find_bounding_box_wikipedia({ :north => north, :east => east, :south => south, :west => west }) }

      let(:north) { +43.900120387 }
      let(:east)  { -78.882869834 }
      let(:south) { +43.82 }
      let(:west)  { +79.0  }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/wikipediaBoundingBox?a=a&east=#{east}&lang=en&north=#{north}&south=#{south}&west=#{west}" }
      let(:fixture_folder) { "wikipedia_bounding_box" }
      let(:fixture_file)   { "wyoming.xml" }

      it { should be_a_kind_of(Array) }

      it "returns WikipediaArticle instances" do
        subject.each do |element|
          element.should be_a_kind_of WikipediaArticle
        end
      end
    end
  end
end
