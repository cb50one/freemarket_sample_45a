require 'rails_helper'

describe Item do
  describe '#index' do
    it "アイテム一覧が表示される" do
      item = build(:item)
    end
  end

  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthday_info" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a shipping_method" do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method]).to include("can't be blank")
    end

    it "is invalid without a shipping_charge" do
      item = build(:item, shipping_charge: nil)
      item.valid?
      expect(item.errors[:shipping_charge]).to include("can't be blank")
    end

    it "is invalid without a ship_from_region" do
      item = build(:item, ship_from_region: nil)
      item.valid?
      expect(item.errors[:ship_from_region]).to include("can't be blank")
    end

    it "is invalid without a shipping_date" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid name charactors more than 40" do
      item = build(:item, name: "a"*41)
      item.valid?
      expect(item.errors[:name][0]).to include("is too long")
    end

    it "is invalid name charactors less than 40" do
      item = build(:item, name: "a"*40)
      expect(item).to be_valid
    end

    it "is invalid description charactors more than 1000" do
      item = build(:item, description: "a"*1001)
      item.valid?
      expect(item.errors[:description][0]).to include("is too long")
    end

    it "is invalid description charactors less than 1000" do
      item = build(:item, description: "a"*1000)
      expect(item).to be_valid
    end

  end
end
