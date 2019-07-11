require 'rails_helper'



RSpec.describe Pizza, type: :model do
    before do
        @crust_1 = Crust.create(dough: "One", price: 1.00)     
        @sauce_1 = Sauce.create(flavor: "Uno")
    end
    
    let(:valid_attributes) do
        {
            name: "Pizza1",
            size: "Small",
            crust_id: @crust_1.id,
            sauce_id: @sauce_1.id
        }
    end

    let(:missing_name) {valid_attributes.except(:name)}
    let(:missing_size) {valid_attributes.except(:size)}
    let(:missing_crust_id) {valid_attributes.except(:crust_id)}
    let(:missing_sauce_id) {valid_attributes.except(:sauce_id)}

    it "is valid when expected" do
        expect(Pizza.new(valid_attributes)).to be_valid
    end

    it "is invalid without a name" do
        expect(Pizza.new(missing_name)).to be_invalid
    end

    it "is invalid without a size" do
        expect(Pizza.new(missing_size)).to be_invalid
    end
    
    it "is invalid without a crust" do
        expect(Pizza.new(missing_crust_id)).to be_invalid
    end

    it "is invalid without a sauce" do
        expect(Pizza.new(missing_sauce_id)).to be_invalid
    end
end